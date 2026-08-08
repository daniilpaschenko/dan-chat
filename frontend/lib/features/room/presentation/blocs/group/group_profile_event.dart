import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/room_entity.dart';

part 'group_profile_event.freezed.dart';

@freezed
class GroupProfileEvent with _$GroupProfileEvent {
  const factory GroupProfileEvent.started() = GroupProfileStarted;
  const factory GroupProfileEvent.participantRemoveRequested(String userId) =
      GroupProfileParticipantRemoveRequested;
  // приходит после успешного возврата с экрана добавления участников
  const factory GroupProfileEvent.participantsAdded(RoomEntity room) =
      GroupProfileParticipantsAdded;
  // прилетело room:updated по сокету для нашей комнаты — тихо перезапрашиваем актуальные данные
  const factory GroupProfileEvent.roomUpdatedRemotely() = GroupProfileRoomUpdatedRemotely;
  // прилетело room:deleted по сокету — нас кикнули или чат удалили
  const factory GroupProfileEvent.roomRemovedRemotely() = GroupProfileRoomRemovedRemotely;
}