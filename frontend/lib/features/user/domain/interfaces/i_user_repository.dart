import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';

abstract class IUserRepository {
  Future<Either<Failure, List<PartialUserEntity>>> searchUsers(String query);

  Future<Either<Failure, UserEntity>> getMyProfile();

  Future<Either<Failure, PartialUserEntity>> getUserProfile(String userId);

  Future<Either<Failure, UserEntity>> uploadAvatar(File file);

  Future<Either<Failure, Unit>> saveDeviceToken({
    required String token,
    required String platform,
  });

  Future<Either<Failure, Unit>> removeDeviceToken(String token);
}