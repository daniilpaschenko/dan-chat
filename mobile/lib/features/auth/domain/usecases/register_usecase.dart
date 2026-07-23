import 'package:dartz/dartz.dart';
import '../../../../core/models/failures.dart';
import '../../data/models/auth_response.dart';
import '../interfaces/i_auth_repository.dart';

// здесь в будущем будет бизнес-логика
class RegisterUseCase {
  final IAuthRepository _repository;

  const RegisterUseCase(this._repository);

  Future<Either<Failure, AuthResponse>> call({
    required String email,
    required String password,
    required String username,
  }) {
    return _repository.register(email: email, password: password, username: username);
  }
}