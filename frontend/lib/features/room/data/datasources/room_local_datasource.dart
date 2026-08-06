import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../models/room.dart';
import '../../../../core/storage/hive_service.dart';

class RoomLocalDatasource {
  static const String _myRoomsKey = 'my_rooms';

  Box get _box => Hive.box(HiveService.roomsBoxName);

  // отдаём то, что успели сохранить в прошлый раз (может быть null, если кэша ещё нет)
  List<RoomListItem>? getCachedRooms() {
    final raw = _box.get(_myRoomsKey) as String?;
    if (raw == null) return null;

    final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((json) => RoomListItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // сохраняем свежий список после успешного запроса к серверу
  Future<void> cacheRooms(List<RoomListItem> rooms) async {
    final raw = jsonEncode(rooms.map((r) => r.toJson()).toList());
    await _box.put(_myRoomsKey, raw);
  }

  Future<void> clearCachedRoom(String roomId) async {
    final cachedRooms = getCachedRooms() ?? [];
    final updatedRooms = cachedRooms.where((r) => r.id != roomId).toList();
    await cacheRooms(updatedRooms);
  }

  Future<void> clear() async {
    await _box.delete(_myRoomsKey);
  }
}