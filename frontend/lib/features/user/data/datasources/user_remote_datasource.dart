import 'package:cross_file/cross_file.dart';
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

  Future<User> uploadAvatar(XFile file) async {
    final bytes = await file.readAsBytes(); // работает и на web, и на mobile
    final formData = FormData.fromMap({
      'avatar': MultipartFile.fromBytes(
        bytes,
        filename: file.name, // XFile.name — кросс-платформенное имя файла
      ),
    });
    final response = await _dio.post('/users/me/avatar', data: formData);
    return User.fromJson(response.data['user'] as Map<String, dynamic>);
  }

  Future<User> changeUsername(String name) async {
    final response = await _dio.patch(
      '/users/me/username',
      data: {'username': name},
    );
    // бэк оборачивает в { user: ... }, как и getMe/uploadAvatar
    return User.fromJson(response.data['user'] as Map<String, dynamic>);
  }

  Future<void> saveDeviceToken({
    required String token,
    required String platform,
  }) async {
    await _dio.post(
      '/users/device-token',
      data: {'token': token, 'platform': platform},
    );
  }

  Future<void> removeDeviceToken(String token) async {
    await _dio.delete(
      '/users/device-token',
      data: {'token': token},
    );
  }
}