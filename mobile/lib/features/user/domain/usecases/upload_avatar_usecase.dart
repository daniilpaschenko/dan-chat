import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/user_model.dart';
import '../interfaces/i_user_repository.dart';

class UploadAvatarUseCase {
  final IUserRepository _repository;
  const UploadAvatarUseCase(this._repository);

  Future<Either<Failure, User>> call(File file) => _repository.uploadAvatar(file);
}