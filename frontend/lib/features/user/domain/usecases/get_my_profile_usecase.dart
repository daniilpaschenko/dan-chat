import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../interfaces/i_user_repository.dart';

class GetMyProfileUseCase {
  final IUserRepository _repository;
  const GetMyProfileUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call() => _repository.getMyProfile();
}