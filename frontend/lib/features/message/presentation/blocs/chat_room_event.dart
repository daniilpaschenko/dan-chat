import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/message_entity.dart';
import '../../../user/domain/entities/user_entity.dart';

part 'chat_room_event.freezed.dart';

@freezed
class ChatRoomEvent with _$ChatRoomEvent {
  const factory ChatRoomEvent.started(String roomId) = ChatRoomStarted;
  const factory ChatRoomEvent.loadMoreRequested() = LoadMoreRequested;
  const factory ChatRoomEvent.sendMessageRequested(String text) = SendMessageRequested;

  const factory ChatRoomEvent.deleteRoomRequested() = DeleteRoomRequested;
  const factory ChatRoomEvent.leaveRoomRequested() = LeaveRoomRequested;

  // приходят из подписки на SocketService
  const factory ChatRoomEvent.socketMessageReceived(MessageEntity message) = SocketMessageReceived;
  const factory ChatRoomEvent.socketMessageRead(String userId) = SocketMessageRead;
  const factory ChatRoomEvent.socketAckReceived(String tempId, Map<String, dynamic> ack) = SocketAckReceived;
  const factory ChatRoomEvent.typingStarted(String userId, String username) = TypingStarted;
  const factory ChatRoomEvent.typingStopped(String userId) = TypingStopped;
  const factory ChatRoomEvent.presenceUpdated(String userId, UserStatus status, DateTime? lastSeen) = ChatRoomPresenceUpdated;

  // вызывается из UI при вводе текста, чтобы слать typing:start/stop
  const factory ChatRoomEvent.typingTextChanged(String text) = TypingTextChanged;

  const factory ChatRoomEvent.participantsStatusSnapshotReceived(
    Map<String, UserStatus> statusMap,
    Map<String, DateTime> lastSeenMap,
  ) = ChatRoomParticipantsStatusSnapshotReceived;
}