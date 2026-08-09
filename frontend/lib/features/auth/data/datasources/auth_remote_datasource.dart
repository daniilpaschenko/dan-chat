import 'package:dio/dio.dart';
import '../models/auth_response.dart';

class AuthRemoteDatasource {
    final Dio _dio;

    const AuthRemoteDatasource(this._dio);

    // регистрация
    Future<AuthResponse> register({
        required String email,
        required String password,
        required String username,
    }) async {
        final response = await _dio.post(
            '/auth/register',
            data: {'email': email, 'password': password, 'username': username},
        );
        return AuthResponse.fromJson(response.data);
    }

    // логин
    Future<AuthResponse> login({
        required String email,
        required String password,
    }) async {
        final response = await _dio.post(
            '/auth/login',
            data: {'email': email, 'password': password},
        );
        return AuthResponse.fromJson(response.data);
    }

    // выход
    Future<void> logout({String? refreshToken}) async {
        await _dio.post('/auth/logout', data: {'refreshToken': refreshToken});
    }

    /// refreshToken == null на вебе, на мобилке — обязателен
    Future<RefreshResponse> refresh({String? refreshToken}) async {
        final response = await _dio.post(
            '/auth/refresh',
            data: refreshToken != null ? {'refreshToken': refreshToken} : null,
        );
        return RefreshResponse.fromJson(response.data);
    }
}
