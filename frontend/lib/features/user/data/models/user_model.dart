import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart' show UserStatus;

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String email,
    String? avatarUrl,
    String? avatarPublicId,
    @Default(UserStatus.offline) UserStatus status,
    DateTime? lastSeen,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// соответствует .populate('participants.user', 'username avatarUrl status lastSeen')
// "частичный юзер"
@freezed
class PartialUser with _$PartialUser {
  const factory PartialUser({
    required String id,
    required String username,
    String? avatarUrl,
    UserStatus? status,
    DateTime? lastSeen,
  }) = _PartialUser;

  factory PartialUser.fromJson(Map<String, dynamic> json) =>
      _$PartialUserFromJson(json);
}
