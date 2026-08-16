import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../interfaces/i_user_repository.dart';

class SaveDeviceTokenUseCase {
  final IUserRepository _repository;
  const SaveDeviceTokenUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required String token,
    required String platform,
  }) {
    return _repository.saveDeviceToken(token: token, platform: platform);
  }
}