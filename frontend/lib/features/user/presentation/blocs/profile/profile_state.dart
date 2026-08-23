import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../../room/domain/entities/room_entity.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;

  const factory ProfileState.loaded({
    required bool isOwnProfile,
    UserEntity? ownUser, // если isOwnProfile == true
    PartialUserEntity? otherUser, // если isOwnProfile == false
    @Default(false) bool isUploadingAvatar,
    @Default(false) bool isCreatingChat,
    @Default(false) bool isChangingUsername,
    RoomEntity? navigateToRoom, // одноразовый сигнал для навигации с полными данными
    String? chatError, // одноразовое сообщение об ошибке создания чата
    String? usernameError, // одноразовое сообщение об ошибке смены имени
  }) = ProfileLoaded;

  const factory ProfileState.failure(String message) = ProfileFailure;
}