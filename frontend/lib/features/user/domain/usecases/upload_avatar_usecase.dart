import 'package:cross_file/cross_file.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../interfaces/i_user_repository.dart';

class UploadAvatarUseCase {
  final IUserRepository _repository;
  const UploadAvatarUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call(XFile file) => _repository.uploadAvatar(file);
}