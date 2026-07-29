import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/user_model.dart';
import '../interfaces/i_user_repository.dart';

class GetUserProfileUseCase {
  final IUserRepository _repository;
  const GetUserProfileUseCase(this._repository);

  Future<Either<Failure, PartialUser>> call(String userId) =>
      _repository.getUserProfile(userId);
}