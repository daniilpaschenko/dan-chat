import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/room_entity.dart';

part 'room_list_state.freezed.dart';

@freezed
class RoomListState with _$RoomListState {

  // начальный
  const factory RoomListState.initial() = RoomListInitial;

  // загрузка
  const factory RoomListState.loading() = RoomListLoading;

  // загрузилось, отдаём список комнат
  const factory RoomListState.loaded(
    List<RoomListItemEntity> rooms, {
    // кто сейчас печатает в этой комнате
    @Default({}) Map<String, Map<String, String>> typingByRoom,
  }) = RoomListLoaded;

  // рефреш поверх уже отображённого списка — старые rooms остаются
  // на экране, RefreshIndicator крутится, а список не мигает пустотой
  const factory RoomListState.refreshing(
    List<RoomListItemEntity> rooms, {
    // кто сейчас печатает в этой комнате
    @Default({}) Map<String, Map<String, String>> typingByRoom,
  }) = RoomListRefreshing;

  // ошибка + сообщение об ошибке
  const factory RoomListState.failure(String message) = RoomListFailure;
}