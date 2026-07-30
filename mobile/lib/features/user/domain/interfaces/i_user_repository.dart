import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/user_model.dart';

abstract class IUserRepository {
  Future<Either<Failure, List<PartialUser>>> searchUsers(String query);

  Future<Either<Failure, User>> getMyProfile();

  Future<Either<Failure, PartialUser>> getUserProfile(String userId);

  Future<Either<Failure, User>> uploadAvatar(File file);
}