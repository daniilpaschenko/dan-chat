import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';
import '../interfaces/i_auth_repository.dart';

// здесь в будущем будет бизнес-логика
class RegisterUseCase {
  final IAuthRepository _repository;

  const RegisterUseCase(this._repository);

  Future<Either<Failure, AuthEntity>> call({
    required String email,
    required String password,
    required String username,
  }) {
    return _repository.register(email: email, password: password, username: username);
  }
}