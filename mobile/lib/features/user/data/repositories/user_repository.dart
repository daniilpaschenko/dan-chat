import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/dio_exception_mapper.dart';
import '../../domain/interfaces/i_user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../datasources/user_local_datasource.dart';
import '../models/user_model.dart';

class UserRepository implements IUserRepository {
  final UserRemoteDatasource _remoteDatasource;
  final UserLocalDatasource _localDatasource;

  const UserRepository(this._remoteDatasource, this._localDatasource);

  @override
  Future<Either<Failure, List<PartialUser>>> searchUsers(String query) async {
    try {
      final users = await _remoteDatasource.search(query: query);
      return Right(users);
    } on DioException catch (e) {
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getMyProfile() async {
    try {
      final user = await _remoteDatasource.getMe();
      await _localDatasource.cacheMe(user);
      return Right(user);
    } on DioException catch (e) {
      // ошибка сети — пробуем отдать закэшированный профиль вместо ошибки
      final cached = _localDatasource.getCachedMe();
      if (cached != null) return Right(cached);
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PartialUser>> getUserProfile(String userId) async {
    try {
      final user = await _remoteDatasource.getUserById(userId);
      await _localDatasource.cacheUserProfile(userId, user);
      return Right(user);
    } on DioException catch (e) {
      // ошибка сети — пробуем отдать закэшированный профиль вместо ошибки
      final cached = _localDatasource.getCachedUserProfile(userId);
      if (cached != null) return Right(cached);
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> uploadAvatar(File file) async {
    try {
      final user = await _remoteDatasource.uploadAvatar(file);
      await _localDatasource.cacheMe(user); // кэш сразу актуализируем
      return Right(user);
    } on DioException catch (e) {
      // override не нужен т.к. логика та же
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }
}