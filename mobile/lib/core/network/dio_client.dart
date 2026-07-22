import 'dart:async';
import 'package:dio/dio.dart';
import '../storage/secure_storage_service.dart';
import 'api_constants.dart';
import '../../features/auth/data/models/auth_response.dart';

/// собирает готовый dio с baseUrl и interceptor'ом,
/// который подставляет access token и делает refresh при 401
class DioClient {
  final SecureStorageService _secureStorageService;

  /// вызывается, когда refresh не удался (например, обнаружено
  /// повторное использование токена) — UI должен разлогинить юзера
  final void Function()? onAuthFailure;

  DioClient(this._secureStorageService, {this.onAuthFailure});

  // отдельный dio без interceptor'ов — чтобы refresh-запрос не попадал в тот же перехватчик и не зациклился
  late final Dio _refreshDio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
    ),
  );

  bool _isRefreshing = false;
  final List<Completer<void>> _refreshWaiters = [];

  Dio build() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _secureStorageService.getAccessToken();
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

            final newToken = await _secureStorageService.getAccessToken();
            final requestOptions = error.requestOptions;
            requestOptions.headers['Authorization'] = 'Bearer $newToken';
            requestOptions.extra['isRetry'] = true;

            final response = await dio.fetch(requestOptions);
            handler.resolve(response);
          } catch (e) {
            await _secureStorageService.deleteTokens();
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
      final refreshToken = await _secureStorageService.getRefreshToken();
      if (refreshToken == null) {
        throw Exception('No refresh token');
      }

      final response = await _refreshDio.post(
        '/api/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      final refreshResponse = RefreshResponse.fromJson(response.data);

      // бэкенд ротирует refresh token — старый становится невалидным сразу после использования, поэтому сохраняем оба
      await _secureStorageService.saveTokens(
        accessToken: refreshResponse.accessToken,
        refreshToken: refreshResponse.refreshToken,
      );

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