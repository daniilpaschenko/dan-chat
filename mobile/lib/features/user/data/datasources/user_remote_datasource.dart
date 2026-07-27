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
}