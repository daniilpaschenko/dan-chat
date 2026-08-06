import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../domain/entities/room_entity.dart';

part 'room_list_event.freezed.dart';

@freezed
class RoomListEvent with _$RoomListEvent {
  // грузим список комнат — используется и при первом входе на экран
  const factory RoomListEvent.loadRequested() = LoadRequested;

  // pull-to-refresh — отдельно от loadRequested, чтобы bloc мог решить,
  // показывать полноэкранный лоадер или сохранить текущий список
  const factory RoomListEvent.refreshRequested() = RefreshRequested;

  // юзер открыл комнату из списка — обнуляем unreadCount на бэке
  const factory RoomListEvent.roomOpened(String roomId) = RoomOpened;

  // юзер удалил комнату из списка
  const factory RoomListEvent.roomRemoved(String roomId) = RoomListRoomRemoved;

  const factory RoomListEvent.roomCreated(RoomListItemEntity room) = RoomListRoomCreated;

  const factory RoomListEvent.roomUpdated(RoomListItemEntity room) = RoomListRoomUpdated;

  // внутреннее событие — обновление статуса участника из сокета
  const factory RoomListEvent.presenceUpdated({
    required String userId,
    required UserStatus status,
    DateTime? lastSeen,
  }) = RoomListPresenceUpdated;

  const factory RoomListEvent.typingStarted({
    required String roomId,
    required String userId,
    required String username,
  }) = RoomListTypingStarted;

  const factory RoomListEvent.typingStopped({
    required String roomId,
    required String userId,
  }) = RoomListTypingStopped;

  const factory RoomListEvent.messageReceived({
    required String roomId,
    required String text,
    required String senderId,
    DateTime? createdAt,
  }) = RoomListMessageReceived;

  const factory RoomListEvent.messageRead({
    required String roomId,
    required String userId,
  }) = RoomListMessageRead;
}