import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/auth_response.dart';

abstract class IAuthRepository {
  // Either<Failure, AuthResponse>:
  // Left — ошибка, Right — успешный ответ (с токенами и юзером)
  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthResponse>> register({
    required String email,
    required String password,
    required String username,
  });

  Future<Either<Failure, Unit>> logout();
}