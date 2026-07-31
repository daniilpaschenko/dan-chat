import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/data/models/user_model.dart'; // TODO: domain/entities/user_entity.dart

part 'auth_entity.freezed.dart';

@freezed
class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String accessToken,
    required String refreshToken,
    required User user, // TODO: UserEntity
  }) = _AuthEntity;
}