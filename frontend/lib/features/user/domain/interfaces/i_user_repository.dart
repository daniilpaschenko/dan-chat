import 'package:cross_file/cross_file.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';

abstract class IUserRepository {
  Future<Either<Failure, List<PartialUserEntity>>> searchUsers(String query);

  Future<Either<Failure, UserEntity>> getMyProfile();

  Future<Either<Failure, PartialUserEntity>> getUserProfile(String userId);

  Future<Either<Failure, UserEntity>> uploadAvatar(XFile file);

  Future<Either<Failure, UserEntity>> changeUsername(String name);

  Future<Either<Failure, Unit>> saveDeviceToken({
    required String token,
    required String platform,
  });

  Future<Either<Failure, Unit>> removeDeviceToken(String token);
}