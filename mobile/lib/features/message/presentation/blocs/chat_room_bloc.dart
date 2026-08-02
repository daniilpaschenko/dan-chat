import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/socket_service.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../../user/domain/usecases/get_my_profile_usecase.dart';
import '../../data/models/message.dart';
import '../../data/mappers/message_mapper.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/usecases/get_room_messages_usecase.dart';
import 'chat_room_event.dart';
import 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final GetRoomMessagesUseCase _getRoomMessagesUseCase;
  final GetMyProfileUseCase _getMyProfileUseCase;
  final SocketService _socketService;
  final String _currentUserId;

  UserEntity? _currentUser;
  StreamSubscription? _messageSub;
  StreamSubscription? _typingStartSub;
  StreamSubscription? _typingStopSub;
  StreamSubscription? _presenceSub;
  Timer? _typingStopTimer;
  bool _isTypingSent = false;

  ChatRoomBloc({
    required GetRoomMessagesUseCase getRoomMessagesUseCase,
    required GetMyProfileUseCase getMyProfileUseCase,
    required SocketService socketService,
    required String currentUserId,
  })  : _getRoomMessagesUseCase = getRoomMessagesUseCase,
        _getMyProfileUseCase = getMyProfileUseCase,
        _socketService = socketService,
        _currentUserId = currentUserId,
        super(ChatRoomState.initial('')) {
    on<ChatRoomStarted>(_onStarted);
    on<LoadMoreRequested>(_onLoadMoreRequested);
    on<SendMessageRequested>(_onSendMessageRequested);
    on<SocketMessageReceived>(_onSocketMessageReceived);
    on<SocketAckReceived>(_onSocketAckReceived);
    on<TypingStarted>(_onTypingStarted);
    on<TypingStopped>(_onTypingStopped);
    on<TypingTextChanged>(_onTypingTextChanged);
    on<ChatRoomPresenceUpdated>(_onPresenceUpdated);
  }

  Future<void> _onStarted(
    ChatRoomStarted event,
    Emitter<ChatRoomState> emit,
  ) async {
    // эмит состояния initial где isInitialLoading: true (был false)
    emit(ChatRoomState.initial(event.roomId).copyWith(isInitialLoading: true));

    final profileResult = await _getMyProfileUseCase();
    profileResult.fold(
      (_) {},
      (user) => _currentUser = user,
    );

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

    _socketService.joinRoom(event.roomId);

    _messageSub = _socketService.messageNew$.listen((data) {
      final entity = Message.fromJson(data).toEntity();
      if (entity.room == event.roomId) {
        add(ChatRoomEvent.socketMessageReceived(entity));
      }
    });

    _typingStartSub = _socketService.typingStart$.listen((data) {
      if (data['roomId'] == event.roomId && data['userId'] != _currentUserId) {
        add(ChatRoomEvent.typingStarted(data['userId'] as String, data['username'] as String));
      }
    });

    _typingStopSub = _socketService.typingStop$.listen((data) {
      if (data['roomId'] == event.roomId) {
        add(ChatRoomEvent.typingStopped(data['userId'] as String));
      }
    });

    _presenceSub = _socketService.presenceUpdate$.listen((data) {
      add(ChatRoomEvent.presenceUpdated(
        data['userId'] as String,
        data['status'] == 'online' ? UserStatus.online : UserStatus.offline,
        data['lastSeen'] != null ? DateTime.parse(data['lastSeen'] as String) : null,
      ));
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
      onAck: (ack) => add(ChatRoomEvent.socketAckReceived(tempId, ack)),
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

    final realMessage = Message.fromJson(
      Map<String, dynamic>.from(event.ack['message'] as Map),
    ).toEntity();

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

  @override
  Future<void> close() {
    _socketService.leaveRoom(state.roomId);
    _messageSub?.cancel();
    _typingStartSub?.cancel();
    _typingStopSub?.cancel();
    _presenceSub?.cancel();
    _typingStopTimer?.cancel();
    return super.close();
  }
}