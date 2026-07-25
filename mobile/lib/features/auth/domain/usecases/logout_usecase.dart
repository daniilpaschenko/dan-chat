import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../interfaces/i_auth_repository.dart';

class LogoutUseCase {
  final IAuthRepository _repository;

  const LogoutUseCase(this._repository);

  Future<Either<Failure, Unit>> call() {
    return _repository.logout();
  }
}