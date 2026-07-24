import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/failures.dart';
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
    on<RoomOpened>(_onRoomOpened);
  }

  Future<void> _onLoadRequested(
    LoadRequested event,
    Emitter<RoomListState> emit,
  ) async {
    emit(const RoomListState.loading());

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
    // не блокируем UI лоадером, обнуление unreadCount должно быть "фоновым"
    // юзер уже перешёл в комнату к моменту, когда этот запрос отработает
    final result = await _markRoomAsReadUseCase(event.roomId);

    result.fold(
      // ошибку обнуления unread молча логируем, а не рушим весь экран
      (failure) {},
      (_) {
        // если текущий стейт уже loaded — оптимистично обнуляем
        // unreadCount конкретной комнаты в списке без нового запроса на бэкенд
        final currentState = state;
        if (currentState is RoomListLoaded) {
          final updatedRooms = currentState.rooms.map((room) {
            return room.id == event.roomId
                ? room.copyWith(unreadCount: 0)
                : room;
          }).toList();
          emit(RoomListState.loaded(updatedRooms));
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.when(
      invalidCredentials: () => 'Сессия истекла, войдите заново',
      emailAlreadyInUse: () => 'Что-то пошло не так',
      validation: (message) => message,
      network: () => 'Проверьте подключение к интернету',
      sessionExpired: () => 'Сессия истекла, войдите заново',
      unexpected: (message) => 'Не удалось загрузить чаты',
    );
  }
}