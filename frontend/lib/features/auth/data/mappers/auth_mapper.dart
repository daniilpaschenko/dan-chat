import '../../../../features/user/data/mappers/user_mapper.dart';

import '../models/auth_response.dart';
import '../../domain/entities/auth_entity.dart';

// маппинг data-слой -> domain-слой
// repository теперь отдаёт наружу AuthEntity, а не AuthResponse напрямую
extension AuthResponseMapper on AuthResponse {
  AuthEntity toEntity() {
    return AuthEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user.toEntity(),
    );
  }
}

extension RefreshResponseMapper on RefreshResponse {
  AuthEntity toEntity() {
    return AuthEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user.toEntity(),
    );
  }
}