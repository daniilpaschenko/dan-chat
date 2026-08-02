import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/domain/entities/user_entity.dart';

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

  // внутреннее событие — обновление статуса участника из сокета
  const factory RoomListEvent.presenceUpdated({
    required String userId,
    required UserStatus status,
    DateTime? lastSeen,
  }) = RoomListPresenceUpdated;
}