import '../models/room.dart';
import '../../domain/entities/room_entity.dart';

extension ParticipantMapper on Participant {
  ParticipantEntity toEntity() {
    return ParticipantEntity(
      user: user,
      role: role,
      joinedAt: joinedAt,
    );
  }
}

extension LastMessageMapper on LastMessage {
  LastMessageEntity toEntity() {
    return LastMessageEntity(
      text: text,
      sender: sender,
      createdAt: createdAt,
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