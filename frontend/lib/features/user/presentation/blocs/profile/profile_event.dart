import 'package:cross_file/cross_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user_entity.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = ProfileStarted;
  const factory ProfileEvent.avatarUploadRequested(XFile file) = ProfileAvatarUploadRequested;
  const factory ProfileEvent.chatRequested() = ProfileChatRequested;
  const factory ProfileEvent.chatNavigationHandled() = ProfileChatNavigationHandled;
  const factory ProfileEvent.chatErrorHandled() = ProfileChatErrorHandled;

  const factory ProfileEvent.presenceUpdated({
    required UserStatus status,
    DateTime? lastSeen,
  }) = ProfilePresenceUpdated;
}