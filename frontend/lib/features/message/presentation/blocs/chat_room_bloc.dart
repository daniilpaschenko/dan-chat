import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/socket_service.dart';
import '../../../../core/services/room_sync_service.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../../room/domain/usecases/mark_room_as_read_usecase.dart';
import '../../../room/domain/usecases/delete_room_usecase.dart';
import '../../../room/domain/usecases/leave_room_usecase.dart';
import '../../../user/domain/usecases/get_my_profile_usecase.dart';
import '../../../room/domain/usecases/get_room_by_id_usecase.dart';
import '../../domain/usecases/parse_socket_message_usecase.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/usecases/get_room_messages_usecase.dart';
import '../../../room/domain/entities/room_entity.dart';
import 'chat_room_event.dart';
import 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final GetRoomMessagesUseCase _getRoomMessagesUseCase;
  final GetMyProfileUseCase _getMyProfileUseCase;
  final MarkRoomAsReadUseCase _markRoomAsReadUseCase;
  final DeleteRoomUseCase _deleteRoomUseCase;
  final LeaveRoomUseCase _leaveRoomUseCase;
  final GetRoomByIdUseCase _getRoomByIdUseCase;
  final ParseSocketMessageUseCase _parseSocketMessageUseCase;
  final SocketService _socketService;
  final RoomSyncService _roomSyncService;
  final String _currentUserId;

  UserEntity? _currentUser;
  StreamSubscription? _messageSub;
  StreamSubscription? _typingStartSub;
  StreamSubscription? _typingStopSub;
  StreamSubscription? _presenceSub;
  StreamSubscription? _messageReadSub;
  StreamSubscription? _roomDeletedSub;
  StreamSubscription? _reconnectSub;
  Timer? _typingStopTimer;
  bool _isTypingSent = false;

  ChatRoomBloc({
    required GetRoomMessagesUseCase getRoomMessagesUseCase,
    required GetMyProfileUseCase getMyProfileUseCase,
    required MarkRoomAsReadUseCase markRoomAsReadUseCase,
    required DeleteRoomUseCase deleteRoomUseCase,
    required LeaveRoomUseCase leaveRoomUseCase,
    required GetRoomByIdUseCase getRoomByIdUseCase,
    required ParseSocketMessageUseCase parseSocketMessageUseCase,
    required SocketService socketService,
    required RoomSyncService roomSyncService,
    required String currentUserId,
  })  : _getRoomMessagesUseCase = getRoomMessagesUseCase,
        _getMyProfileUseCase = getMyProfileUseCase,
        _markRoomAsReadUseCase = markRoomAsReadUseCase,
        _deleteRoomUseCase = deleteRoomUseCase,
        _leaveRoomUseCase = leaveRoomUseCase,
        _getRoomByIdUseCase = getRoomByIdUseCase,
        _parseSocketMessageUseCase = parseSocketMessageUseCase,
        _socketService = socketService,
        _roomSyncService = roomSyncService,
        _currentUserId = currentUserId,
        super(ChatRoomState.initial('')) {
    on<ChatRoomStarted>(_onStarted);
    on<LoadMoreRequested>(_onLoadMoreRequested);
    on<SendMessageRequested>(_onSendMessageRequested);
    on<DeleteRoomRequested>(_onDeleteRoomRequested);
    on<LeaveRoomRequested>(_onLeaveRoomRequested);
    on<SocketMessageReceived>(_onSocketMessageReceived);
    on<SocketAckReceived>(_onSocketAckReceived);
    on<TypingStarted>(_onTypingStarted);
    on<TypingStopped>(_onTypingStopped);
    on<TypingTextChanged>(_onTypingTextChanged);
    on<ChatRoomPresenceUpdated>(_onPresenceUpdated);
    on<ChatRoomParticipantsStatusSnapshotReceived>(_onParticipantsStatusSnapshot);
    on<SocketMessageRead>(_onSocketMessageRead);
    on<ChatRoomRoomRemovedRemotely>((event, emit) => emit(state.copyWith(roomRemoved: true)));
    on<ChatRoomReconnected>(_onReconnected);
  }

  Future<void> _onStarted(
    ChatRoomStarted event,
    Emitter<ChatRoomState> emit,
  ) async {
    // эмит состояния initial где isInitialLoading: true (был false)
    emit(ChatRoomState.initial(event.roomId).copyWith(
      isInitialLoading: true,
      room: event.room, // сразу кладём если было передано снаружи
    ));

    final profileResult = await _getMyProfileUseCase();
    profileResult.fold(
      (_) {},
      (user) => _currentUser = user,
    );

  // если room не был передан снаружи (переход по пушу) — грузим сами
  if (event.room == null) {
    final roomResult = await _getRoomByIdUseCase(event.roomId);
    roomResult.fold(
      (failure) {}, // не критично — просто останется без шапки/пустая, ниже поймём если нужно error-состояние
      (fetchedRoom) => emit(state.copyWith(room: fetchedRoom.toListItem(_currentUserId))),
    );
  }

    final pageResult = await _getRoomMessagesUseCase(roomId: event.roomId);
    pageResult.fold(
      (failure) => emit(state.copyWith(
        isInitialLoading: false,
        errorMessage: 'Не удалось загрузить сообщения',
      )),
      (page) => emit(state.copyWith(
        isInitialLoading: false,
        messages: page.messages,
        nextCursor: page.nextCursor,
        hasMore: page.hasMore,
        errorMessage: null,
      )),
    );

    _socketService.joinRoom(event.roomId, onAck: (ack) {
      if (isClosed) return;
      if (ack['ok'] != true) return;
      final list = (ack['participantsStatus'] as List?) ?? [];

      final statusMap = <String, UserStatus>{};
      final lastSeenMap = <String, DateTime>{};

      for (final item in list) {
        final map = Map<String, dynamic>.from(item as Map);
        final uid = map['userId'] as String;
        statusMap[uid] = map['status'] == 'online' ? UserStatus.online : UserStatus.offline;
        if (map['lastSeen'] != null) {
          lastSeenMap[uid] = DateTime.parse(map['lastSeen'] as String);
        }
      }

      add(ChatRoomEvent.participantsStatusSnapshotReceived(statusMap, lastSeenMap));
    });

    _messageSub = _socketService.messageNew$.listen((data) {
      if (isClosed) return;
      final entity = _parseSocketMessageUseCase(data);
      if (entity.room == event.roomId) {
        add(ChatRoomEvent.socketMessageReceived(entity));
      }
    });

    _typingStartSub = _socketService.typingStart$.listen((data) {
      if (isClosed) return;
      if (data['roomId'] == event.roomId && data['userId'] != _currentUserId) {
        add(ChatRoomEvent.typingStarted(data['userId'] as String, data['username'] as String));
      }
    });

    _typingStopSub = _socketService.typingStop$.listen((data) {
      if (isClosed) return;
      if (data['roomId'] == event.roomId) {
        add(ChatRoomEvent.typingStopped(data['userId'] as String));
      }
    });

    _presenceSub = _socketService.presenceUpdate$.listen((data) {
      if (isClosed) return;
      add(ChatRoomEvent.presenceUpdated(
        data['userId'] as String,
        data['status'] == 'online' ? UserStatus.online : UserStatus.offline,
        data['lastSeen'] != null ? DateTime.parse(data['lastSeen'] as String) : null,
      ));
    });

    _roomSyncService.notifyRoomRead(event.roomId);

    _socketService.markRead(event.roomId);

    _messageReadSub = _socketService.messageRead$.listen((data) {
      if (isClosed) return;
      if (data['roomId'] == event.roomId) {
        add(ChatRoomEvent.socketMessageRead(data['userId'] as String));
      }
    });

    _roomDeletedSub = _socketService.roomDeleted$.listen((data) {
      if (isClosed) return;
      if (data['roomId'] == event.roomId) {
        add(const ChatRoomEvent.roomRemovedRemotely());
      }
    });

    _reconnectSub = _socketService.connect$.listen((_) {
      if (isClosed) return;
      add(const ChatRoomEvent.reconnected());
    });
  }

  Future<void> _onLoadMoreRequested(
    LoadMoreRequested event,
    Emitter<ChatRoomState> emit,
  ) async {
    // не грузим повторно, если уже грузим или больше нечего грузить
    if (state.isLoadingMore || !state.hasMore) return;

    // показываем индикатор загрузки
    emit(state.copyWith(isLoadingMore: true));

    final result = await _getRoomMessagesUseCase(
      roomId: state.roomId,
      before: state.nextCursor,
    );

    result.fold(
      (failure) => emit(state.copyWith(isLoadingMore: false)),
      (page) => emit(state.copyWith(
        isLoadingMore: false,
        // новая (более старая) страница добавляется В НАЧАЛО списка, т.к. список у нас от старых к новым
        messages: [...page.messages, ...state.messages],
        nextCursor: page.nextCursor,
        hasMore: page.hasMore,
      )),
    );
  }

  Future<void> _onSendMessageRequested(
    SendMessageRequested event,
    Emitter<ChatRoomState> emit,
  ) async {
    final text = event.text.trim();
    if (text.isEmpty) return;

    final tempId = 'temp_${DateTime.now().microsecondsSinceEpoch}';

    // оптимистичное сообщение — показываем сразу
    final optimistic = MessageEntity(
      id: tempId,
      room: state.roomId,
      sender: PartialUserEntity(
        id: _currentUserId,
        username: _currentUser?.username ?? '',
        avatarUrl: _currentUser?.avatarUrl,
      ),
      text: text,
      createdAt: DateTime.now(),
      sendStatus: MessageSendStatus.sending,
    );

    emit(state.copyWith(messages: [...state.messages, optimistic]));

    // typing:stop, раз уж отправляем сообщение
    if (_isTypingSent) {
      _socketService.stopTyping(state.roomId);
      _isTypingSent = false;
      _typingStopTimer?.cancel();
    }

    _socketService.sendMessage(
      roomId: state.roomId,
      text: text,
      onAck: (ack) {
        if (isClosed) return;
        add(ChatRoomEvent.socketAckReceived(tempId, ack));
      },
    );
  }

  void _onSocketAckReceived(
    SocketAckReceived event,
    Emitter<ChatRoomState> emit,
  ) {
    final ok = event.ack['ok'] == true;

    if (!ok) {
      emit(state.copyWith(
        messages: state.messages.map((m) {
          if (m.id != event.tempId) return m;
          return m.copyWith(sendStatus: MessageSendStatus.failed);
        }).toList(),
        errorMessage: 'Не удалось отправить сообщение',
      ));
      return;
    }

    final realMessage = _parseSocketMessageUseCase(
      Map<String, dynamic>.from(event.ack['message'] as Map),
    );

    // если реальное сообщение уже прилетело по message:new — просто убираем temp-дубликат
    final alreadyArrived = state.messages.any((m) => m.id == realMessage.id);

    final updated = state.messages
        .where((m) => m.id != event.tempId) // убираем temp-версию
        .toList();

    if (!alreadyArrived) {
      updated.add(realMessage.copyWith(sendStatus: MessageSendStatus.sent));
      updated.sort((a, b) => (a.createdAt ?? DateTime.now())
          .compareTo(b.createdAt ?? DateTime.now()));
    }

    emit(state.copyWith(messages: updated));
  }

  void _onSocketMessageReceived(
    SocketMessageReceived event,
    Emitter<ChatRoomState> emit,
  ) {
    final incoming = event.message;

    // уже есть с таким реальным id — игнор (например, свой же broadcast)
    if (state.messages.any((m) => m.id == incoming.id)) return;

    // пробуем смэтчить с temp-сообщением, которое мы сами отправили,
    // но ack ещё не пришёл (broadcast обогнал ack)
    final tempIndex = state.messages.indexWhere((m) =>
        m.sendStatus == MessageSendStatus.sending &&
        m.sender.id == incoming.sender.id &&
        m.sender.id == _currentUserId &&
        m.text == incoming.text);

    final updated = [...state.messages];
    if (tempIndex != -1) {
      updated[tempIndex] = incoming.copyWith(sendStatus: MessageSendStatus.sent);
    } else {
      updated.add(incoming);
    }

    emit(state.copyWith(messages: updated));

    // мы уже открыли этот чат и видим новое сообщение — сразу помечаем прочитанным,
    // но только если сообщение не от нас самих (свои и так не влияют на unreadCount)
    if (incoming.sender.id != _currentUserId) {
      _markRoomAsReadUseCase(state.roomId); // обновить на бэкенде
      _roomSyncService.notifyRoomRead(state.roomId); // сообщить списку чатов
      _socketService.markRead(state.roomId);
    }
  }

  void _onTypingStarted(TypingStarted event, Emitter<ChatRoomState> emit) {
    emit(state.copyWith(
      typingUsers: {...state.typingUsers, event.userId: event.username},
    ));
  }

  void _onTypingStopped(TypingStopped event, Emitter<ChatRoomState> emit) {
    final updated = Map<String, String>.from(state.typingUsers)
      ..remove(event.userId);
    emit(state.copyWith(typingUsers: updated));
  }

  // вызывать из TextField.onChanged; сам решает, когда слать start/stop
  void _onTypingTextChanged(TypingTextChanged event, Emitter<ChatRoomState> emit) {
    if (event.text.trim().isEmpty) {
      if (_isTypingSent) {
        _socketService.stopTyping(state.roomId);
        _isTypingSent = false;
      }
      _typingStopTimer?.cancel();
      return;
    }

    if (!_isTypingSent) {
      _socketService.startTyping(state.roomId);
      _isTypingSent = true;
    }

    // если 3 секунды нет новых нажатий — считаем, что юзер перестал печатать
    _typingStopTimer?.cancel();
    _typingStopTimer = Timer(const Duration(seconds: 3), () {
      _socketService.stopTyping(state.roomId);
      _isTypingSent = false;
    });
  }

  void _onPresenceUpdated(ChatRoomPresenceUpdated event, Emitter<ChatRoomState> emit) {
    emit(state.copyWith(
      participantsStatus: {...state.participantsStatus, event.userId: event.status},
      participantsLastSeen: event.lastSeen != null
        ? {...state.participantsLastSeen, event.userId: event.lastSeen!}
        : state.participantsLastSeen,
    ));
  }

  void _onParticipantsStatusSnapshot(
    ChatRoomParticipantsStatusSnapshotReceived event,
    Emitter<ChatRoomState> emit,
  ) {
    emit(state.copyWith(
      participantsStatus: {...event.statusMap, ...state.participantsStatus},
      participantsLastSeen: {...event.lastSeenMap, ...state.participantsLastSeen},
    ));
  }

  void _onSocketMessageRead(SocketMessageRead event, Emitter<ChatRoomState> emit) {
    final updated = state.messages.map((m) {
      if (m.readBy.contains(event.userId)) return m;
      return m.copyWith(readBy: [...m.readBy, event.userId]);
    }).toList();
    emit(state.copyWith(messages: updated));
  }

  Future<void> _onDeleteRoomRequested(
    DeleteRoomRequested event,
    Emitter<ChatRoomState> emit,
  ) async {
    final result = await _deleteRoomUseCase(state.roomId);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: 'Не удалось удалить чат')),
      (_) {
        // явная отписка от сокета
        _socketService.leaveRoom(state.roomId);
        _roomSyncService.notifyRoomRemoved(state.roomId);
        emit(state.copyWith(roomRemoved: true));
      },
    );
  }

  Future<void> _onLeaveRoomRequested(
    LeaveRoomRequested event,
    Emitter<ChatRoomState> emit,
  ) async {
    final result = await _leaveRoomUseCase(state.roomId);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: 'Не удалось покинуть чат')),
      (_) {
        // явная отписка от сокета
        _socketService.leaveRoom(state.roomId);
        _roomSyncService.notifyRoomRemoved(state.roomId);
        emit(state.copyWith(roomRemoved: true));
      },
    );
  }

  Future<void> _onReconnected(
    ChatRoomReconnected event,
    Emitter<ChatRoomState> emit,
  ) async {
    // подтягиваем самую свежую страницу (без before — сервер отдаёт последние N сообщений)
    final result = await _getRoomMessagesUseCase(roomId: state.roomId);

    result.fold(
      (failure) {}, // не критично — просто останемся с тем, что уже есть
      (page) {
        final existingIds = state.messages.map((m) => m.id).toSet();
        final newOnes = page.messages.where((m) => !existingIds.contains(m.id));

        final merged = [...state.messages, ...newOnes]
          ..sort((a, b) =>
              (a.createdAt ?? DateTime.now()).compareTo(b.createdAt ?? DateTime.now()));

        emit(state.copyWith(messages: merged));
      },
    );

    // раз юзер вернулся и видит чат — помечаем прочитанным, как и при обычном входе
    _socketService.markRead(state.roomId);
    _roomSyncService.notifyRoomRead(state.roomId);
  }

  @override
  Future<void> close() async {
    // дожидаемся реальной отмены подписок, а не просто "запроса на отмену"
    await Future.wait([
      if (_messageSub != null) _messageSub!.cancel(),
      if (_typingStartSub != null) _typingStartSub!.cancel(),
      if (_typingStopSub != null) _typingStopSub!.cancel(),
      if (_presenceSub != null) _presenceSub!.cancel(),
      if (_messageReadSub != null) _messageReadSub!.cancel(),
      if (_roomDeletedSub != null) _roomDeletedSub!.cancel(),
      if (_reconnectSub != null) _reconnectSub!.cancel(),
    ]);
    _typingStopTimer?.cancel();
    return super.close();
  }
}