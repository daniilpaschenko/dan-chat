import 'package:dio/dio.dart';
import '../models/message.dart';
import '../models/messages_page.dart';

class MessageRemoteDatasource {
  final Dio _dio;

  const MessageRemoteDatasource(this._dio);

  // before — id последнего сообщения из предыдущей страницы (nextCursor), null при первой загрузке
  Future<MessagesPage> getRoomMessages({
    required String roomId,
    String? before,
    int limit = 30,
  }) async {
    final response = await _dio.get(
      '/rooms/$roomId/messages',
      queryParameters: {
        'before': ?before,
        'limit': limit,
      },
    );
    return MessagesPage.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Message> createMessage({
    required String roomId,
    required String text,
  }) async {
    final response = await _dio.post(
      '/rooms/$roomId/messages',
      data: {'text': text},
    );
    return Message.fromJson(response.data as Map<String, dynamic>);
  }
}