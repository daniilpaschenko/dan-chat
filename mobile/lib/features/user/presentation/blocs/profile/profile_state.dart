import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/user_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;

  const factory ProfileState.loaded({
    required bool isOwnProfile,
    User? ownUser, // если isOwnProfile == true
    PartialUser? otherUser, // если isOwnProfile == false
    @Default(false) bool isUploadingAvatar,
  }) = ProfileLoaded;

  const factory ProfileState.failure(String message) = ProfileFailure;
}