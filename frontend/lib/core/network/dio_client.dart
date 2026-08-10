import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../storage/secure_storage_service.dart';
import '../storage/web_token_holder.dart';
import 'api_constants.dart';
import '../../features/auth/data/models/auth_response.dart';

/// собирает готовый dio с baseUrl и interceptor'ом,
/// который подставляет access token и делает refresh при 401
class DioClient {
  final SecureStorageService _secureStorageService; // используется только на мобилке
  final WebTokenHolder _webTokenHolder; // используется только на вебе

  /// вызывается, когда refresh не удался (например, обнаружено
  /// повторное использование токена) — UI должен разлогинить юзера
  final void Function()? onAuthFailure;

    DioClient(
      this._secureStorageService,
      this._webTokenHolder, {
      this.onAuthFailure,
    });

  // отдельный dio без interceptor'ов — чтобы refresh-запрос не попадал в тот же перехватчик и не зациклился
  late final Dio _refreshDio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      extra: {'withCredentials': true}, // обязательно для cookies
    ),
  );

  bool _isRefreshing = false;
  final List<Completer<void>> _refreshWaiters = [];

  Future<String?> _getAccessToken() {
    return kIsWeb
        ? Future.value(_webTokenHolder.getAccessToken())
        : _secureStorageService.getAccessToken();
  }

  Future<void> _saveAccessToken(String token) async {
    if (kIsWeb) {
      _webTokenHolder.saveAccessToken(token);
    } else {
      await _secureStorageService.saveAccessToken(token);
    }
  }

  Future<void> _clearTokens() async {
    if (kIsWeb) {
      _webTokenHolder.clear();
    } else {
      await _secureStorageService.deleteTokens();
    }
  }

  Dio build() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          ApiConstants.clientTypeHeader: ApiConstants.clientType,
        },
        extra: {'withCredentials': true}, // не мешает мобилке, нужно вебу
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          final isUnauthorized = error.response?.statusCode == 401;
          final isRetry = error.requestOptions.extra['isRetry'] == true;

          if (!isUnauthorized || isRetry) {
            handler.next(error);
            return;
          }

          try {
            await _refreshTokenIfNeeded();

            final newToken = await _getAccessToken();
            final requestOptions = error.requestOptions;
            requestOptions.headers['Authorization'] = 'Bearer $newToken';
            requestOptions.extra['isRetry'] = true;

            final response = await dio.fetch(requestOptions);
            handler.resolve(response);
          } catch (e) {
            await _clearTokens();
            onAuthFailure?.call();
            handler.next(error);
          }
        },
      ),
    );

    return dio;
  }

  Future<void> _refreshTokenIfNeeded() async {
    if (_isRefreshing) {
      // ждём, пока текущий refresh завершится, вместо того чтобы запускать параллельный
      final completer = Completer<void>();
      _refreshWaiters.add(completer);
      return completer.future;
    }

    _isRefreshing = true;
    try {
      late final Response response;

      if (kIsWeb) {
        // refresh token не трогаем вообще — он в httpOnly cookie
        response = await _refreshDio.post(
          '/auth/refresh',
          options: Options(
            headers: {ApiConstants.clientTypeHeader: ApiConstants.clientType},
          ),
        );
      } else {
        final refreshToken = await _secureStorageService.getRefreshToken();
        if (refreshToken == null) {
          throw Exception('No refresh token');
        }
        response = await _refreshDio.post(
          '/auth/refresh',
          data: {'refreshToken': refreshToken},
        );
      }

      final refreshResponse = RefreshResponse.fromJson(response.data);

      if (kIsWeb) {
        // на вебе бэкенд не возвращает refreshToken в теле — только accessToken
        await _saveAccessToken(refreshResponse.accessToken);
      } else {
        final refreshToken = refreshResponse.refreshToken;
        if (refreshToken == null) {
          throw Exception('Сервер не вернул refreshToken для мобильного клиента');
        }
        await _secureStorageService.saveTokens(
          accessToken: refreshResponse.accessToken,
          refreshToken: refreshToken,
        );
      }

      for (final waiter in _refreshWaiters) {
        waiter.complete();
      }
      _refreshWaiters.clear();
    } catch (e) {
      for (final waiter in _refreshWaiters) {
        waiter.completeError(e);
      }
      _refreshWaiters.clear();
      rethrow;
    } finally {
      _isRefreshing = false;
    }
  }
}