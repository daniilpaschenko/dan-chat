import 'package:dartz/dartz.dart';
import '../../../../core/models/failures.dart';
import '../../data/models/auth_response.dart';
import '../interfaces/i_auth_repository.dart';

// здесь в будущем будет бизнес-логика
class LoginUseCase {
  final IAuthRepository _repository;

  const LoginUseCase(this._repository);

  Future<Either<Failure, AuthResponse>> call({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
  }
}