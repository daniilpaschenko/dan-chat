import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failure_mapper.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/get_my_rooms_usecase.dart';
import '../../domain/usecases/mark_room_as_read_usecase.dart';

import 'room_list_event.dart';
import 'room_list_state.dart';

class RoomListBloc extends Bloc<RoomListEvent, RoomListState> {
  final GetMyRoomsUseCase _getMyRoomsUseCase;
  final MarkRoomAsReadUseCase _markRoomAsReadUseCase;

  RoomListBloc({
    required GetMyRoomsUseCase getMyRoomsUseCase,
    required MarkRoomAsReadUseCase markRoomAsReadUseCase,
  })  : _getMyRoomsUseCase = getMyRoomsUseCase,
        _markRoomAsReadUseCase = markRoomAsReadUseCase,
        super(const RoomListState.initial()) {
    on<LoadRequested>(_onLoadRequested);
    on<RefreshRequested>(_onRefreshRequested);
    on<RoomOpened>(_onRoomOpened);
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

  String _mapFailureToMessage(Failure failure) {
    return failure.maybeWhen(
      unexpected: (_) => 'Не удалось загрузить чаты',
      orElse: () => defaultFailureMessage(failure),
    );
  }
}