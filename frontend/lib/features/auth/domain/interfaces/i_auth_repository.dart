import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';

abstract class IAuthRepository {
  // Either<Failure, AuthEntity>:
  // Left — ошибка, Right — успешный ответ (с токенами и юзером)
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthEntity>> register({
    required String email,
    required String password,
    required String username,
  });

  Future<Either<Failure, Unit>> logout();
}