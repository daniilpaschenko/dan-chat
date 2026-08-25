import '../../../../features/user/data/mappers/user_mapper.dart';
import '../../../message/domain/entities/message_entity.dart' show MessageTypeEntity, SystemMessageAction;

import '../models/room.dart';
import '../../domain/entities/room_entity.dart';

extension ParticipantMapper on Participant {
  ParticipantEntity toEntity() {
    return ParticipantEntity(
      user: user.toEntity(),
      role: role,
      joinedAt: joinedAt,
    );
  }
}

extension LastMessageTypeDtoMapper on LastMessageTypeDto {
  MessageTypeEntity toEntity() {
    switch (this) {
      case LastMessageTypeDto.text:
        return MessageTypeEntity.text;
      case LastMessageTypeDto.system:
        return MessageTypeEntity.system;
    }
  }
}

extension LastMessageSystemActionDtoMapper on LastMessageSystemActionDto {
  SystemMessageAction toEntity() {
    switch (this) {
      case LastMessageSystemActionDto.participantAdded:
        return SystemMessageAction.participantAdded;
      case LastMessageSystemActionDto.participantRemoved:
        return SystemMessageAction.participantRemoved;
      case LastMessageSystemActionDto.participantLeft:
        return SystemMessageAction.participantLeft;
      case LastMessageSystemActionDto.participantPromoted:
        return SystemMessageAction.participantPromoted;
      case LastMessageSystemActionDto.participantDemoted:
        return SystemMessageAction.participantDemoted;
    }
  }
}

extension LastMessageMapper on LastMessage {
  LastMessageEntity toEntity() {
    return LastMessageEntity(
      text: text,
      sender: sender,
      createdAt: createdAt,
      readBy: readBy,
      type: type.toEntity(),
      systemAction: systemAction?.toEntity(),
      systemActorUsername: systemActorUsername,
      systemTargetUsername: systemTargetUsername,
    );
  }
}

extension RoomMapper on Room {
  RoomEntity toEntity() {
    return RoomEntity(
      id: id,
      type: type,
      name: name,
      avatarUrl: avatarUrl,
      participants: participants.map((p) => p.toEntity()).toList(),
      createdBy: createdBy,
      lastMessage: lastMessage?.toEntity(),
      unreadCount: unreadCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension RoomListItemMapper on RoomListItem {
  RoomListItemEntity toEntity() {
    return RoomListItemEntity(
      id: id,
      type: type,
      name: name,
      avatarUrl: avatarUrl,
      participants: participants.map((p) => p.toEntity()).toList(),
      createdBy: createdBy,
      lastMessage: lastMessage?.toEntity(),
      unreadCount: unreadCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}