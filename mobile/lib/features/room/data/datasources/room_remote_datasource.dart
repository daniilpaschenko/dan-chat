import 'package:dio/dio.dart';
import '../models/room.dart';

class RoomRemoteDatasource {
  final Dio _dio;

  const RoomRemoteDatasource(this._dio);

  // GET /rooms
  // бэкенд отдаёт голый массив, unreadCount уже готовое число, поэтому парсим как RoomListItem
  Future<List<RoomListItem>> getMyRooms() async {
    final response = await _dio.get('/rooms');
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => RoomListItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // GET /rooms/:roomId
  Future<Room> getRoomById(String roomId) async {
    final response = await _dio.get('/rooms/$roomId');
    return Room.fromJson(response.data as Map<String, dynamic>);
  }

  // POST /rooms
  Future<Room> createRoom({
    required RoomType type,
    String? name,
    String? avatarUrl,
    required List<String> participantIds,
  }) async {
    final response = await _dio.post(
      '/rooms',
      data: {
        // enum -> строка 'direct'/'group' благодаря freezed
        'type': type.name,
        'participantIds': participantIds,
        'name': ?name,
        'avatarUrl': ?avatarUrl,
      },
    );
    return Room.fromJson(response.data as Map<String, dynamic>);
  }

  // POST /rooms/:roomId/read — возвращает просто { unreadCount: 0 }
  Future<void> markRoomAsRead(String roomId) async {
    await _dio.post('/rooms/$roomId/read');
  }

  // POST /rooms/:roomId/participants
  Future<Room> addParticipant({
    required String roomId,
    required String userId,
  }) async {
    final response = await _dio.post(
      '/rooms/$roomId/participants',
      data: {'userId': userId},
    );
    return Room.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Room?> removeParticipant({
    required String roomId,
    required String userId,
  }) async {
    final response = await _dio.delete('/rooms/$roomId/participants/$userId');
    final data = response.data as Map<String, dynamic>;

    // если бэк удалил комнату — в ответе только { message: '...' }, ключа 'participants' не будет
    if (!data.containsKey('participants')) return null;

    return Room.fromJson(data);
  }
}