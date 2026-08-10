import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/domain/entities/user_entity.dart';

part 'auth_entity.freezed.dart';

@freezed
class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String accessToken,
    String? refreshToken,
    required UserEntity user,
  }) = _AuthEntity;
}