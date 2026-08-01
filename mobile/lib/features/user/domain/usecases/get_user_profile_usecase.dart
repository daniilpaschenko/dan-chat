import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../interfaces/i_user_repository.dart';

class GetUserProfileUseCase {
  final IUserRepository _repository;
  const GetUserProfileUseCase(this._repository);

  Future<Either<Failure, PartialUserEntity>> call(String userId) =>
      _repository.getUserProfile(userId);
}