import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failure_mapper.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/socket_service.dart';
import '../../../../core/services/read_sync_service.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../domain/entities/room_entity.dart';
import '../../domain/usecases/get_my_rooms_usecase.dart';
import '../../domain/usecases/mark_room_as_read_usecase.dart';

import 'room_list_event.dart';
import 'room_list_state.dart';

class RoomListBloc extends Bloc<RoomListEvent, RoomListState> {
  final GetMyRoomsUseCase _getMyRoomsUseCase;
  final MarkRoomAsReadUseCase _markRoomAsReadUseCase;
  final SocketService _socketService;
  final ReadSyncService _readSyncService;
  final String? _currentUserId;

  StreamSubscription? _presenceSub;
  StreamSubscription? _typingStartSub;
  StreamSubscription? _typingStopSub;
  StreamSubscription? _messageSub;
  StreamSubscription? _roomReadSub;
  StreamSubscription? _messageReadSub;

  RoomListBloc({
    required GetMyRoomsUseCase getMyRoomsUseCase,
    required MarkRoomAsReadUseCase markRoomAsReadUseCase,
    required SocketService socketService,
    required ReadSyncService readSyncService,
    required String? currentUserId,
  }) : _getMyRoomsUseCase = getMyRoomsUseCase,
      _markRoomAsReadUseCase = markRoomAsReadUseCase,
      _socketService = socketService,
      _readSyncService = readSyncService,
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
    _roomReadSub = _readSyncService.roomRead$.listen((roomId) {
      add(RoomListEvent.roomOpened(roomId));
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
      (rooms) => emit(RoomListState.loaded(rooms)),
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
    return super.close();
  }
}
