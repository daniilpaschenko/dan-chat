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
            '/api/auth/register',
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
            '/api/auth/login',
            data: {'email': email, 'password': password},
        );
        return AuthResponse.fromJson(response.data);
    }

    // выход
    Future<void> logout({required String refreshToken}) async {
        await _dio.post('/api/auth/logout', data: {'refreshToken': refreshToken});
    }
}
