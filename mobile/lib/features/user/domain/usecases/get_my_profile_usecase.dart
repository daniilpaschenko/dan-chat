import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/user_model.dart';
import '../interfaces/i_user_repository.dart';

class GetMyProfileUseCase {
  final IUserRepository _repository;
  const GetMyProfileUseCase(this._repository);

  Future<Either<Failure, User>> call() => _repository.getMyProfile();
}