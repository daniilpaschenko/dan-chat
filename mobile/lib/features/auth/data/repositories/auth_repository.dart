import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/dio_exception_mapper.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/interfaces/i_auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/auth_response.dart';

class AuthRepository implements IAuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final SecureStorageService _secureStorageService;

  const AuthRepository(this._remoteDatasource, this._secureStorageService);

  @override
  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await _remoteDatasource.login(
        email: email,
        password: password,
      );

      // при успехе сразу сохраняем токены
      await _secureStorageService.saveTokens(
        accessToken: authResponse.accessToken,
        refreshToken: authResponse.refreshToken,
      );

      // bloc просто получает готовый AuthResponse
      return Right(authResponse);
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final authResponse = await _remoteDatasource.register(
        email: email,
        password: password,
        username: username,
      );

      await _secureStorageService.saveTokens(
        accessToken: authResponse.accessToken,
        refreshToken: authResponse.refreshToken,
      );

      return Right(authResponse);
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      final refreshToken = await _secureStorageService.getRefreshToken();

      // если токена и так нет — локально уже разлогинены, ничего слать не нужно
      if (refreshToken != null) {
        try {
          await _remoteDatasource.logout(refreshToken: refreshToken);
        } on DioException {
          // игнор ошибки т.к. даже если бэкенд недоступен, юзер должен выйти локально
        }
      }

      await _secureStorageService.deleteTokens();
      return const Right(unit);
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  // маппим DioException в доменный Failure
  Failure _mapDioException(DioException e) {
    return mapDioExceptionToFailure(
      e,
      // auth-специфичные статусы, которых нет в дефолтном маппере
      statusOverride: (statusCode, message) {
        switch (statusCode) {
          case 401:
            return const Failure.invalidCredentials();
          case 409:
            return const Failure.emailAlreadyInUse();
          default:
            return null; // дефолтная логика маппера разберёт остальное
        }
      },
    );
  }
}