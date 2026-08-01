import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';
import '../interfaces/i_auth_repository.dart';

// здесь в будущем будет бизнес-логика
class LoginUseCase {
  final IAuthRepository _repository;

  const LoginUseCase(this._repository);

  Future<Either<Failure, AuthEntity>> call({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
  }
}