import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

enum UserStatus { online, offline }

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String username,
    required String email,
    String? avatarUrl,
    String? avatarPublicId,
    @Default(UserStatus.offline) UserStatus status,
    DateTime? lastSeen,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserEntity;
}

// соответствует .populate('participants.user', 'username avatarUrl status lastSeen')
// "частичный юзер"
@freezed
class PartialUserEntity with _$PartialUserEntity {
  const factory PartialUserEntity({
    required String id,
    required String username,
    String? avatarUrl,
    UserStatus? status,
    DateTime? lastSeen,
  }) = _PartialUserEntity;
}