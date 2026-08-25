import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/data/models/user_model.dart';
import '../../domain/entities/room_entity.dart' show RoomType, ParticipantRole;

part 'room.freezed.dart';
part 'room.g.dart';

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

// dto-enum'ы только для парсинга JSON с бэка (snake_case)
enum LastMessageTypeDto {
  @JsonValue('text')
  text,
  @JsonValue('system')
  system,
}

enum LastMessageSystemActionDto {
  @JsonValue('participant_added')
  participantAdded,
  @JsonValue('participant_removed')
  participantRemoved,
  @JsonValue('participant_left')
  participantLeft,
  @JsonValue('participant_promoted')
  participantPromoted,
  @JsonValue('participant_demoted')
  participantDemoted,
}

@freezed
class LastMessage with _$LastMessage {
  const factory LastMessage({
    String? text,
    String? sender, // ObjectId-строка, не populate'ится нигде
    DateTime? createdAt,
    @Default([]) List<String> readBy,
    @Default(LastMessageTypeDto.text) LastMessageTypeDto type,
    LastMessageSystemActionDto? systemAction,
    String? systemActorUsername,
    String? systemTargetUsername,
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