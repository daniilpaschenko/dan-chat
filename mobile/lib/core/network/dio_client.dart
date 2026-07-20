import 'package:dio/dio.dart';
import '../storage/secure_storage_service.dart';
import 'api_constants.dart';

/// собирает готовый dio с baseUrl и interceptor'ом
class DioClient {
  final SecureStorageService _secureStorageService;

  DioClient(this._secureStorageService);

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
          final token = await _secureStorageService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) {
          // будет логика refresh-токена
          handler.next(error);
        },
      ),
    );

    return dio;
  }
}