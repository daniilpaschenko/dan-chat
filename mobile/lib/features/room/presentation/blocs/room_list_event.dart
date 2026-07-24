import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_list_event.freezed.dart';

@freezed
class RoomListEvent with _$RoomListEvent {
  // грузим список комнат — используется и при первом входе на экран
  const factory RoomListEvent.loadRequested() = LoadRequested;

  // юзер открыл комнату из списка — обнуляем unreadCount на бэке
  const factory RoomListEvent.roomOpened(String roomId) = RoomOpened;
}