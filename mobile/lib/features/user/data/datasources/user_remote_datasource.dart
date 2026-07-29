import 'dart:io';
import 'package:dio/dio.dart';
import '../models/user_model.dart';

class UserRemoteDatasource {
  final Dio _dio;

  const UserRemoteDatasource(this._dio);

  Future<List<PartialUser>> search({
    required String query,
  }) async {
    final response = await _dio.get(
      '/users/search',
      queryParameters: {'query': query},
    );

    // бэкенд отдаёт голый массив пользователей (как и /rooms — без обёртки)
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => PartialUser.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<User> getMe() async {
    final response = await _dio.get('/users/me');
    // бэк оборачивает в { user: ... }
    return User.fromJson(response.data['user'] as Map<String, dynamic>);
  }

  Future<PartialUser> getUserById(String userId) async {
    final response = await _dio.get('/users/$userId');
    return PartialUser.fromJson(response.data as Map<String, dynamic>);
  }

  Future<User> uploadAvatar(File file) async {
    final formData = FormData.fromMap({
      'avatar': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
    });
    final response = await _dio.post('/users/avatar', data: formData);
    return User.fromJson(response.data['user'] as Map<String, dynamic>);
  }
}