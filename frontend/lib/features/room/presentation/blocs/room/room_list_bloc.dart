import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure_mapper.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/socket_service.dart';
import '../../../../../core/services/room_sync_service.dart';
import '../../../../../core/services/unread_rooms_counter.dart';
import '../../../../user/domain/entities/user_entity.dart';
import '../../../domain/entities/room_entity.dart';
import '../../../domain/usecases/get_my_rooms_usecase.dart';
import '../../../domain/usecases/mark_room_as_read_usecase.dart';
import '../../../domain/usecases/parse_socket_room_usecase.dart';

import 'room_list_event.dart';
import 'room_list_state.dart';

class RoomListBloc extends Bloc<RoomListEvent, RoomListState> {
  final GetMyRoomsUseCase _getMyRoomsUseCase;
  final MarkRoomAsReadUseCase _markRoomAsReadUseCase;
  final ParseSocketRoomUseCase _parseSocketRoomUseCase;
  final SocketService _socketService;
  final RoomSyncService _roomSyncService;
  final UnreadRoomsCounter _unreadRoomsCounter;
  final String? _currentUserId;

  StreamSubscription? _presenceSub;
  StreamSubscription? _typingStartSub;
  StreamSubscription? _typingStopSub;
  StreamSubscription? _messageSub;
  StreamSubscription? _roomReadSub;
  StreamSubscription? _messageReadSub;
  StreamSubscription? _roomRemovedSub;
  StreamSubscription? _roomCreatedSub;
  StreamSubscription? _roomUpdatedSub;
  StreamSubscription? _roomDeletedSub;
  StreamSubscription? _reconnectSub;

  RoomListBloc({
    required GetMyRoomsUseCase getMyRoomsUseCase,
    required MarkRoomAsReadUseCase markRoomAsReadUseCase,
    required ParseSocketRoomUseCase parseSocketRoomUseCase,
    required SocketService socketService,
    required RoomSyncService roomSyncService,
    required UnreadRoomsCounter unreadRoomsCounter,
    required String? currentUserId,
  }) : _getMyRoomsUseCase = getMyRoomsUseCase,
      _markRoomAsReadUseCase = markRoomAsReadUseCase,
      _parseSocketRoomUseCase = parseSocketRoomUseCase,
      _socketService = socketService,
      _roomSyncService = roomSyncService,
      _unreadRoomsCounter = unreadRoomsCounter,
      _currentUserId = currentUserId,
      super(const RoomListState.initial()) {
    on<LoadRequested>(_onLoadRequested);
    on<RefreshRequested>(_onRefreshRequested);
    on<RoomOpened>(_onRoomOpened);
    on<RoomListPresenceUpdated>(_onPresenceUpdated);
    on<RoomListTypingStarted>(_onTypingStarted);
    on<RoomListTypingStopped>(_onTypingStopped);
    on<RoomListMessageReceived>(_onMessageReceived);
    on<RoomListMessageRead>(_onMessageRead);
    on<RoomListRoomRemoved>(_onRoomRemoved);
    on<RoomListRoomCreated>(_onRoomCreated);
    on<RoomListRoomUpdated>(_onRoomUpdated);
    on<RoomListReconnected>(_onReconnected);

    _messageReadSub = _socketService.messageRead$.listen((data) {
      add(RoomListEvent.messageRead(
        roomId: data['roomId'] as String,
        userId: data['userId'] as String,
      ));
    });

    _presenceSub = _socketService.presenceUpdate$.listen((data) {
      add(
        RoomListEvent.presenceUpdated(
          userId: data['userId'] as String,
          status: data['status'] == 'online'
              ? UserStatus.online
              : UserStatus.offline,
          lastSeen: data['lastSeen'] != null
              ? DateTime.parse(data['lastSeen'] as String)
              : null,
        ),
      );
    });

    _typingStartSub = _socketService.typingStart$.listen((data) {
      add(
        RoomListEvent.typingStarted(
          roomId: data['roomId'] as String,
          userId: data['userId'] as String,
          username: data['username'] as String,
        ),
      );
    });

    _typingStopSub = _socketService.typingStop$.listen((data) {
      add(
        RoomListEvent.typingStopped(
          roomId: data['roomId'] as String,
          userId: data['userId'] as String,
        ),
      );
    });

    _messageSub = _socketService.messageNew$.listen((data) {
      final roomId = data['room'] as String?;
      if (roomId == null) return;

      // системные сообщения приходят в полном виде через room:updated/room:created —
      // здесь их обрабатывать не нужно
      if (data['type'] == 'system') return;

      final senderRaw = data['sender'];
      final senderId = senderRaw is Map
          ? (senderRaw['id'] ?? senderRaw['_id'])?.toString()
          : senderRaw?.toString();

      add(
        RoomListEvent.messageReceived(
          roomId: roomId,
          text: data['text'] as String? ?? '',
          senderId: senderId ?? '',
          createdAt: data['createdAt'] != null
              ? DateTime.tryParse(data['createdAt'] as String)
              : null,
        ),
      );
    });

    // при получении сигнала "комната прочитана" — просто зовём уже готовый
    // обработчик RoomOpened, он обнуляет unreadCount как локально, так и через REST
    _roomReadSub = _roomSyncService.roomRead$.listen((roomId) {
      add(RoomListEvent.roomOpened(roomId));
    });
    
    _roomRemovedSub = _roomSyncService.roomRemoved$.listen((roomId) {
      add(RoomListEvent.roomRemoved(roomId));
    });

    _roomCreatedSub = _socketService.roomCreated$.listen((data) {
      add(RoomListEvent.roomCreated(_parseSocketRoomUseCase(data)));
    });

    _roomUpdatedSub = _socketService.roomUpdated$.listen((data) {
      add(RoomListEvent.roomUpdated(_parseSocketRoomUseCase(data)));
    });

    _roomDeletedSub = _socketService.roomDeleted$.listen((data) {
      final roomId = data['roomId'] as String?;
      if (roomId != null) add(RoomListEvent.roomRemoved(roomId));
    });

    _reconnectSub = _socketService.connect$.listen((_) {
      add(const RoomListEvent.reconnected());
    });
  }

  List<RoomListItemEntity>? _currentRooms() =>
      state.mapOrNull(loaded: (s) => s.rooms, refreshing: (s) => s.rooms);

  Map<String, Map<String, String>> _currentTyping() =>
      state.mapOrNull(
        loaded: (s) => s.typingByRoom,
        refreshing: (s) => s.typingByRoom,
      ) ??
      {};

  void _emit(
    Emitter<RoomListState> emit, {
    required List<RoomListItemEntity> rooms,
    required Map<String, Map<String, String>> typingByRoom,
  }) {
    state.mapOrNull(
      loaded: (_) =>
          emit(RoomListState.loaded(rooms, typingByRoom: typingByRoom)),
      refreshing: (_) =>
          emit(RoomListState.refreshing(rooms, typingByRoom: typingByRoom)),
    );

    _updateUnreadCounter(rooms);
  }

  void _updateUnreadCounter(List<RoomListItemEntity> rooms) {
    final unreadRoomsCount = rooms.where((r) => r.unreadCount > 0).length;
    _unreadRoomsCounter.update(unreadRoomsCount);
  }

  Future<void> _onLoadRequested(
    LoadRequested event,
    Emitter<RoomListState> emit,
  ) async {
    emit(const RoomListState.loading());
    await _fetchAndEmit(emit);
  }

  Future<void> _onRefreshRequested(
    RefreshRequested event,
    Emitter<RoomListState> emit,
  ) async {
    // сохраняем текущий список, если он есть, чтобы UI не показывал
    // пустой экран/полноэкранный лоадер во время pull-to-refresh
    final currentRooms = _currentRooms();

    emit(RoomListState.refreshing(currentRooms ?? const []));
    await _fetchAndEmit(emit);
  }

  // общая логика похода за данными — используется и первой загрузкой, и рефрешем
  // отличается только состояние ДО вызова
  Future<void> _fetchAndEmit(Emitter<RoomListState> emit) async {
    final result = await _getMyRoomsUseCase();

    result.fold(
      (failure) => emit(RoomListState.failure(_mapFailureToMessage(failure))),
      (rooms) {
        emit(RoomListState.loaded(rooms));
        _updateUnreadCounter(rooms);
      },
    );
  }

  Future<void> _onRoomOpened(
    RoomOpened event,
    Emitter<RoomListState> emit,
  ) async {
    final result = await _markRoomAsReadUseCase(event.roomId);

    result.fold((failure) {}, (_) {
      // проверяем оба состояния, в которых есть список — loaded и refreshing
      final currentRooms = _currentRooms();
      if (currentRooms == null) return;

      final updatedRooms = currentRooms.map((room) {
        return room.id == event.roomId ? room.copyWith(unreadCount: 0) : room;
      }).toList();

      _emit(emit, rooms: updatedRooms, typingByRoom: _currentTyping());
    });
  }

  void _onPresenceUpdated(
    RoomListPresenceUpdated event,
    Emitter<RoomListState> emit,
  ) {
    final currentRooms = _currentRooms();
    if (currentRooms == null) return;

    final updatedRooms = currentRooms.map((room) {
      // применяем ко всем комнатам, где встречается этот участник
      final hasParticipant = room.participants.any(
        (p) => p.user.id == event.userId,
      );
      if (!hasParticipant) return room;

      final updatedParticipants = room.participants.map((p) {
        if (p.user.id != event.userId) return p;
        return p.copyWith(
          user: p.user.copyWith(
            status: event.status,
            lastSeen: event.lastSeen ?? p.user.lastSeen,
          ),
        );
      }).toList();

      return room.copyWith(participants: updatedParticipants);
    }).toList();

    _emit(emit, rooms: updatedRooms, typingByRoom: _currentTyping());
  }

  void _onTypingStarted(
    RoomListTypingStarted event,
    Emitter<RoomListState> emit,
  ) {
    final rooms = _currentRooms();
    if (rooms == null) return;

    final typing = Map<String, Map<String, String>>.from(_currentTyping());
    final roomTyping = Map<String, String>.from(typing[event.roomId] ?? {});
    roomTyping[event.userId] = event.username;
    typing[event.roomId] = roomTyping;

    _emit(emit, rooms: rooms, typingByRoom: typing);
  }

  void _onTypingStopped(
    RoomListTypingStopped event,
    Emitter<RoomListState> emit,
  ) {
    final rooms = _currentRooms();
    if (rooms == null) return;

    final typing = Map<String, Map<String, String>>.from(_currentTyping());
    final roomTyping = Map<String, String>.from(typing[event.roomId] ?? {})..remove(event.userId);
    typing[event.roomId] = roomTyping;

    _emit(emit, rooms: rooms, typingByRoom: typing);
  }

  void _onMessageReceived(
    RoomListMessageReceived event,
    Emitter<RoomListState> emit,
  ) {
    final rooms = _currentRooms();
    if (rooms == null) return;

    final index = rooms.indexWhere((r) => r.id == event.roomId);
    // комнаты может не быть в списке (например, только что создана) — подтянется при следующем refresh
    if (index == -1) return;

    final room = rooms[index];
    final isMine = event.senderId == _currentUserId;

    final updatedRoom = room.copyWith(
      lastMessage: LastMessageEntity(
        text: event.text,
        sender: event.senderId,
        createdAt: event.createdAt,
      ),
      unreadCount: isMine ? room.unreadCount : room.unreadCount + 1,
    );

    // поднимаем комнату с новым сообщением наверх списка
    final updatedRooms = [...rooms]..removeAt(index);
    updatedRooms.insert(0, updatedRoom);

    // если пришло сообщение — печатать этот юзер уже не может
    final typing = Map<String, Map<String, String>>.from(_currentTyping());
    final roomTyping = Map<String, String>.from(typing[event.roomId] ?? {})..remove(event.senderId);
    typing[event.roomId] = roomTyping;

    _emit(emit, rooms: updatedRooms, typingByRoom: typing);
  }

  void _onMessageRead(RoomListMessageRead event, Emitter<RoomListState> emit) {
    final rooms = _currentRooms();
    if (rooms == null) return;

    final updatedRooms = rooms.map((room) {
      if (room.id != event.roomId) return room;
      final lastMessage = room.lastMessage;
      // статус читаем только для своего последнего сообщения
      if (lastMessage == null || lastMessage.sender != _currentUserId) return room;
      if (lastMessage.readBy.contains(event.userId)) return room;

      return room.copyWith(
        lastMessage: lastMessage.copyWith(readBy: [...lastMessage.readBy, event.userId]),
      );
    }).toList();

    _emit(emit, rooms: updatedRooms, typingByRoom: _currentTyping());
  }

  void _onRoomRemoved(RoomListRoomRemoved event, Emitter<RoomListState> emit) {
    final rooms = _currentRooms();
    if (rooms == null) return;

    final updatedRooms = rooms.where((r) => r.id != event.roomId).toList();
    _emit(emit, rooms: updatedRooms, typingByRoom: _currentTyping());
  }

  void _onRoomCreated(RoomListRoomCreated event, Emitter<RoomListState> emit) {
    final rooms = _currentRooms();
    if (rooms == null) return;

    // на случай дублей (например, если REST-refresh уже подтянул эту же комнату)
    if (rooms.any((r) => r.id == event.room.id)) return;

    _emit(emit, rooms: [event.room, ...rooms], typingByRoom: _currentTyping());
  }

  void _onRoomUpdated(RoomListRoomUpdated event, Emitter<RoomListState> emit) {
    final rooms = _currentRooms();
    if (rooms == null) return;

    final updatedRooms = rooms.map((r) => r.id == event.room.id ? event.room : r).toList();
    _emit(emit, rooms: updatedRooms, typingByRoom: _currentTyping());
  }

  Future<void> _onReconnected(
    RoomListReconnected event,
    Emitter<RoomListState> emit,
  ) async {
    // синхронизируемся только если список уже был загружен
    final currentRooms = _currentRooms();
    if (currentRooms == null) return;

    final result = await _getMyRoomsUseCase();

    result.fold(
      (failure) {}, // не критично — список останется как был
      (freshRooms) {
        // сервер — источник правды по lastMessage/unreadCount/participants,
        // поэтому просто заменяем список целиком, но typing оставляем как был
        _emit(emit, rooms: freshRooms, typingByRoom: _currentTyping());
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.maybeWhen(
      unexpected: (_) => 'Не удалось загрузить чаты',
      orElse: () => defaultFailureMessage(failure),
    );
  }

  @override
  Future<void> close() {
    _presenceSub?.cancel();
    _typingStartSub?.cancel();
    _typingStopSub?.cancel();
    _messageSub?.cancel();
    _roomReadSub?.cancel();
    _messageReadSub?.cancel();
    _roomRemovedSub?.cancel();
    _roomCreatedSub?.cancel();
    _roomUpdatedSub?.cancel();
    _roomDeletedSub?.cancel();
    _reconnectSub?.cancel();
    return super.close();
  }
}