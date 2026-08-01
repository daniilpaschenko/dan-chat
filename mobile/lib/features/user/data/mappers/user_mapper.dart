import '../models/user_model.dart';
import '../../domain/entities/user_entity.dart';

extension UserMapper on User {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      email: email,
      avatarUrl: avatarUrl,
      avatarPublicId: avatarPublicId,
      status: status,
      lastSeen: lastSeen,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension PartialUserMapper on PartialUser {
  PartialUserEntity toEntity() {
    return PartialUserEntity(
      id: id,
      username: username,
      avatarUrl: avatarUrl,
      status: status,
      lastSeen: lastSeen,
    );
  }
}