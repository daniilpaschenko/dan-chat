import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/dio_exception_mapper.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../../../core/storage/web_token_holder.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/interfaces/i_auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../mappers/auth_mapper.dart';

class AuthRepository implements IAuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final SecureStorageService _secureStorageService; // мобилка
  final WebTokenHolder _webTokenHolder; // веб

  const AuthRepository(
    this._remoteDatasource,
    this._secureStorageService,
    this._webTokenHolder,
  );

  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await _remoteDatasource.login(
        email: email,
        password: password,
      );

      // при успехе сразу сохраняем токены
      await _persistTokens(authResponse.accessToken, authResponse.refreshToken);

      // наружу отдаём доменную сущность, а не data-модель
      return Right(authResponse.toEntity());
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> register({
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

      await _persistTokens(authResponse.accessToken, authResponse.refreshToken);

      return Right(authResponse.toEntity());
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      if (kIsWeb) {
        // refresh token нам недоступен (httpOnly cookie), просто дергаем /auth/logout
        try {
          await _remoteDatasource.logout(refreshToken: null);
        } on DioException {
          // игнор — юзер всё равно должен выйти локально
        }
        _webTokenHolder.clear();
      } else {
        final refreshToken = await _secureStorageService.getRefreshToken();
        if (refreshToken != null) {
          try {
            await _remoteDatasource.logout(refreshToken: refreshToken);
          } on DioException {
            // игнор
          }
        }
        await _secureStorageService.deleteTokens();
      }

      return const Right(unit);
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> restoreWebSession() async {
    try {
      final refreshResponse = await _remoteDatasource.refresh(refreshToken: null);
      _webTokenHolder.saveAccessToken(refreshResponse.accessToken);
      return Right(refreshResponse.toEntity());
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  Future<void> _persistTokens(String accessToken, String? refreshToken) async {
    if (kIsWeb) {
      _webTokenHolder.saveAccessToken(accessToken);
    } else {
      if (refreshToken == null) {
        throw Exception('Сервер не вернул Refresh token для мобильного клиента');
      }
      await _secureStorageService.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
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