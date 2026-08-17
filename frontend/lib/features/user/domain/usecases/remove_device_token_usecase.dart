import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../interfaces/i_user_repository.dart';

class RemoveDeviceTokenUseCase {
  final IUserRepository _repository;
  const RemoveDeviceTokenUseCase(this._repository);

  Future<Either<Failure, Unit>> call(String token) {
    return _repository.removeDeviceToken(token);
  }
}