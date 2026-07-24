import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/room.dart';

part 'room_list_state.freezed.dart';

@freezed
class RoomListState with _$RoomListState {

  // начальный
  const factory RoomListState.initial() = RoomListInitial;

  // загрузка
  const factory RoomListState.loading() = RoomListLoading;

  // загрузилось, отдаём список комнат
  const factory RoomListState.loaded(List<RoomListItem> rooms) = RoomListLoaded;

  // ошибка + сообщение об ошибке
  const factory RoomListState.failure(String message) = RoomListFailure;
}