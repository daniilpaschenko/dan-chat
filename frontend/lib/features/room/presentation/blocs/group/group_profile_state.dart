import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/room_entity.dart';

part 'group_profile_state.freezed.dart';

@freezed
class GroupProfileState with _$GroupProfileState {
  const factory GroupProfileState.initial() = GroupProfileInitial;
  const factory GroupProfileState.loading() = GroupProfileLoading;

  const factory GroupProfileState.loaded({
    required RoomEntity room,
    @Default(false) bool isRemoving,
    @Default(false) bool isChangingRole,
    String? errorMessage, // одноразовое сообщение об ошибке кика
    // одноразовый сигнал — нас удалили из группы (или её удалили) с другого устройства/владельцем
    @Default(false) bool removedRemotely,
  }) = GroupProfileLoaded;

  const factory GroupProfileState.failure(String message) = GroupProfileFailure;
}