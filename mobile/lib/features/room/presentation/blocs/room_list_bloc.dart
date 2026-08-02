import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failure_mapper.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/socket_service.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../domain/usecases/get_my_rooms_usecase.dart';
import '../../domain/usecases/mark_room_as_read_usecase.dart';

import 'room_list_event.dart';
import 'room_list_state.dart';

class RoomListBloc extends Bloc<RoomListEvent, RoomListState> {
  final GetMyRoomsUseCase _getMyRoomsUseCase;
  final MarkRoomAsReadUseCase _markRoomAsReadUseCase;
  final SocketService _socketService;

  StreamSubscription? _presenceSub;

  RoomListBloc({
    required GetMyRoomsUseCase getMyRoomsUseCase,
    required MarkRoomAsReadUseCase markRoomAsReadUseCase,
    required SocketService socketService,
  })  : _getMyRoomsUseCase = getMyRoomsUseCase,
        _markRoomAsReadUseCase = markRoomAsReadUseCase,
        _socketService = socketService,
        super(const RoomListState.initial()) {
    on<LoadRequested>(_onLoadRequested);
    on<RefreshRequested>(_onRefreshRequested);
    on<RoomOpened>(_onRoomOpened);
    on<RoomListPresenceUpdated>(_onPresenceUpdated);

    _presenceSub = _socketService.presenceUpdate$.listen((data) {
      add(RoomListEvent.presenceUpdated(
        userId: data['userId'] as String,
        status: data['status'] == 'online' ? UserStatus.online : UserStatus.offline,
        lastSeen: data['lastSeen'] != null ? DateTime.parse(data['lastSeen'] as String) : null,
      ));
    });
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
    final currentRooms = state.mapOrNull(
      loaded: (s) => s.rooms,
      refreshing: (s) => s.rooms,
    );

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

    result.fold(
      (failure) {},
      (_) {
        // проверяем оба состояния, в которых есть список — loaded и refreshing
        final currentRooms = state.mapOrNull(
          loaded: (s) => s.rooms,
          refreshing: (s) => s.rooms,
        );
        if (currentRooms == null) return;

        final updatedRooms = currentRooms.map((room) {
          return room.id == event.roomId ? room.copyWith(unreadCount: 0) : room;
        }).toList();

        // сохраняем тот же тип состояния, в котором были
        state.mapOrNull(
          loaded: (_) => emit(RoomListState.loaded(updatedRooms)),
          refreshing: (_) => emit(RoomListState.refreshing(updatedRooms)),
        );
      },
    );
  }

  void _onPresenceUpdated(
    RoomListPresenceUpdated event,
    Emitter<RoomListState> emit,
  ) {
    final currentRooms = state.mapOrNull(
      loaded: (s) => s.rooms,
      refreshing: (s) => s.rooms,
    );
    if (currentRooms == null) return;

    final updatedRooms = currentRooms.map((room) {
      // применяем ко всем комнатам, где встречается этот участник
      final hasParticipant = room.participants.any((p) => p.user.id == event.userId);
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

    state.mapOrNull(
      loaded: (_) => emit(RoomListState.loaded(updatedRooms)),
      refreshing: (_) => emit(RoomListState.refreshing(updatedRooms)),
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
    return super.close();
  }
}