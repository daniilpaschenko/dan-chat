import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_event.freezed.dart';

@freezed
class ChatRoomEvent with _$ChatRoomEvent {
  const factory ChatRoomEvent.started(String roomId) = ChatRoomStarted;

  // юзер доскроллил до верха — грузим следующую (более старую) страницу
  const factory ChatRoomEvent.loadMoreRequested() = LoadMoreRequested;

  const factory ChatRoomEvent.sendMessageRequested(String text) = SendMessageRequested;
}