import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../../message/domain/entities/message_entity.dart' show MessageTypeEntity, SystemMessageAction;

part 'room_entity.freezed.dart';

enum RoomType { direct, group }
enum ParticipantRole { owner, admin, member }

@freezed
class ParticipantEntity with _$ParticipantEntity {
  const factory ParticipantEntity({
    required PartialUserEntity user,
    @Default(ParticipantRole.member) ParticipantRole role,
    DateTime? joinedAt,
  }) = _ParticipantEntity;
}

@freezed
class LastMessageEntity with _$LastMessageEntity {
  const factory LastMessageEntity({
    String? text,
    String? sender,
    DateTime? createdAt,
    @Default([]) List<String> readBy,
    @Default(MessageTypeEntity.text) MessageTypeEntity type,
    SystemMessageAction? systemAction,
    String? systemActorUsername,
    String? systemTargetUsername,
  }) = _LastMessageEntity;
}

// используется для GET /rooms/:roomId (детальный вид)
// и как результат createRoom, addParticipant, removeParticipant
@freezed
class RoomEntity with _$RoomEntity {
  const factory RoomEntity({
    required String id,
    required RoomType type,
    String? name,
    String? avatarUrl,
    required List<ParticipantEntity> participants,
    required String createdBy,
    LastMessageEntity? lastMessage,
    @Default({}) Map<String, int> unreadCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RoomEntity;
}

// используется для GET /rooms (список моих комнат)
// unreadCount тут — уже готовое число для текущего юзера
@freezed
class RoomListItemEntity with _$RoomListItemEntity {
  const factory RoomListItemEntity({
    required String id,
    required RoomType type,
    String? name,
    String? avatarUrl,
    required List<ParticipantEntity> participants,
    required String createdBy,
    LastMessageEntity? lastMessage,
    @Default(0) int unreadCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RoomListItemEntity;
}

extension RoomEntityToListItem on RoomEntity {
  RoomListItemEntity toListItem(String? currentUserId) {
    return RoomListItemEntity(
      id: id,
      type: type,
      name: name,
      avatarUrl: avatarUrl,
      participants: participants,
      createdBy: createdBy,
      lastMessage: lastMessage,
      unreadCount: currentUserId != null ? (unreadCount[currentUserId] ?? 0) : 0,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}