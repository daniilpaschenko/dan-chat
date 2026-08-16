import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/dio_exception_mapper.dart';
import '../../domain/interfaces/i_user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../datasources/user_local_datasource.dart';
import '../../domain/entities/user_entity.dart';
import '../mappers/user_mapper.dart';

class UserRepository implements IUserRepository {
  final UserRemoteDatasource _remoteDatasource;
  final UserLocalDatasource _localDatasource;

  const UserRepository(this._remoteDatasource, this._localDatasource);

  @override
  Future<Either<Failure, List<PartialUserEntity>>> searchUsers(String query) async {
    try {
      final users = await _remoteDatasource.search(query: query);
      return Right(users.map((u) => u.toEntity()).toList());
    } on DioException catch (e) {
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getMyProfile() async {
    try {
      final user = await _remoteDatasource.getMe();
      await _localDatasource.cacheMe(user);
      return Right(user.toEntity());
    } on DioException catch (e) {
      // ошибка сети — пробуем отдать закэшированный профиль вместо ошибки
      final cached = _localDatasource.getCachedMe();
      if (cached != null) return Right(cached.toEntity());
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PartialUserEntity>> getUserProfile(String userId) async {
    try {
      final user = await _remoteDatasource.getUserById(userId);
      await _localDatasource.cacheUserProfile(userId, user);
      return Right(user.toEntity());
    } on DioException catch (e) {
      // ошибка сети — пробуем отдать закэшированный профиль вместо ошибки
      final cached = _localDatasource.getCachedUserProfile(userId);
      if (cached != null) return Right(cached.toEntity());
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> uploadAvatar(File file) async {
    try {
      final user = await _remoteDatasource.uploadAvatar(file);
      await _localDatasource.cacheMe(user); // кэш сразу актуализируем
      return Right(user.toEntity());
    } on DioException catch (e) {
      // override не нужен т.к. логика та же
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveDeviceToken({
    required String token,
    required String platform,
  }) async {
    try {
      await _remoteDatasource.saveDeviceToken(token: token, platform: platform);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeDeviceToken(String token) async {
    try {
      await _remoteDatasource.removeDeviceToken(token);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }
}