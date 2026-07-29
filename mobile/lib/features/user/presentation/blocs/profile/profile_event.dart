import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = ProfileStarted;
  const factory ProfileEvent.avatarUploadRequested(File file) = ProfileAvatarUploadRequested;
}