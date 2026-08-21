import 'package:dio/dio.dart';
import 'package:cross_file/cross_file.dart';
import '../models/room.dart';
import '../../../room/domain/entities/room_entity.dart' show RoomType;

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

  // PATCH /rooms/:roomId/participants/:userId/role
  Future<Room> updateParticipantRole({
    required String roomId,
    required String userId,
    required String role,
  }) async {
    final response = await _dio.patch(
      '/rooms/$roomId/participants/$userId/role',
      data: {'role': role},
    );
    return Room.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> leaveRoom(String roomId) async {
    await _dio.post('/rooms/$roomId/leave');
  }

  Future<void> deleteRoom(String roomId) async {
    await _dio.delete('/rooms/$roomId');
  }

  Future<Room> uploadRoomAvatar(String roomId, XFile file) async {
    final bytes = await file.readAsBytes(); // работает и на web, и на mobile
    final formData = FormData.fromMap({
      'avatar': MultipartFile.fromBytes(
        bytes,
        filename: file.name, // XFile.name — кросс-платформенное имя файла
      ),
    });
    final response = await _dio.post('/rooms/$roomId/avatar', data: formData);
    return Room.fromJson(response.data as Map<String, dynamic>);
  }
}