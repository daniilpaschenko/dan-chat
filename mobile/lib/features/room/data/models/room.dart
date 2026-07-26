import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/data/models/user_model.dart';

part 'room.freezed.dart';
part 'room.g.dart';

enum RoomType { direct, group }
enum ParticipantRole { owner, admin, member }

@freezed
class Participant with _$Participant {
  const factory Participant({
    required PartialUser user,
    @Default(ParticipantRole.member) ParticipantRole role,
    DateTime? joinedAt,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}

@freezed
class LastMessage with _$LastMessage {
  const factory LastMessage({
    String? text,
    String? sender, // ObjectId-строка, не populate'ится нигде
    DateTime? createdAt,
  }) = _LastMessage;

  factory LastMessage.fromJson(Map<String, dynamic> json) =>
      _$LastMessageFromJson(json);
}

// используется для GET /rooms/:roomId (детальный вид)
// и как ответ createRoom, addParticipant, removeParticipant
@freezed
class Room with _$Room {
  const factory Room({
    required String id,
    required RoomType type,
    String? name,
    String? avatarUrl,
    required List<Participant> participants,
    required String createdBy,
    LastMessage? lastMessage,
    @Default({}) Map<String, int> unreadCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

// используется для GET /rooms (список моих комнат)
// unreadCount тут — уже готовое число для текущего юзера
@freezed
class RoomListItem with _$RoomListItem {
  const factory RoomListItem({
    required String id,
    required RoomType type,
    String? name,
    String? avatarUrl,
    required List<Participant> participants,
    required String createdBy,
    LastMessage? lastMessage,
    @Default(0) int unreadCount, // вот отличие
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RoomListItem;

  factory RoomListItem.fromJson(Map<String, dynamic> json) =>
      _$RoomListItemFromJson(json);
}