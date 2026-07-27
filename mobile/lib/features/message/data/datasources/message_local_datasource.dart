import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../../../../core/storage/hive_service.dart';
import '../models/message.dart';

class MessageLocalDatasource {
  Box get _box => Hive.box(HiveService.messagesBoxName);

  String _key(String roomId) => 'messages_$roomId';

  // получить все сохраненные сообщения комнаты
  Future<List<Message>> getCachedMessages(String roomId) async {
    final raw = _box.get(_key(roomId));

    if (raw == null) return [];

    final List<dynamic> decoded = jsonDecode(raw as String);

    return decoded
        .map((e) => Message.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  // полностью заменить локальный кэш
  Future<void> saveCachedMessages({
    required String roomId,
    required List<Message> messages,
  }) async {
    final json = messages.map((e) => e.toJson()).toList();

    await _box.put(_key(roomId), jsonEncode(json));
  }

  // сохранить первую страницу с сервера
  Future<void>cacheFirstPage({
    required String roomId,
    required List<Message> messages,
  }) async {
    await saveCachedMessages(
      roomId: roomId,
      messages: messages,
    );
  }

  // добавить более старые сообщения (дубликаты автоматически пропускаются)
  Future<void> appendOlderMessages({
    required String roomId,
    required List<Message> olderMessages,
  }) async {
    final current = await getCachedMessages(roomId);

    final ids = current.map((e) => e.id).toSet();

    current.addAll(
      olderMessages.where((e) => !ids.contains(e.id)),
    );

    await saveCachedMessages(
      roomId: roomId,
      messages: current,
    );
  }

  // добавить новое отправленное/полученное сообщение
  Future<void> addNewMessage({
    required String roomId,
    required Message message,
  }) async {
    final current = await getCachedMessages(roomId);

    if (current.any((e) => e.id == message.id)) {
      return;
    }

    current.insert(0, message);

    await saveCachedMessages(
      roomId: roomId,
      messages: current,
    );
  }

  // обновить сообщение (например после edit)
  Future<void> updateCachedMessage({
    required String roomId,
    required Message message,
  }) async {
    final current = await getCachedMessages(roomId);

    final index = current.indexWhere((e) => e.id == message.id);

    if (index == -1) {
      current.insert(0, message);
    } else {
      current[index] = message;
    }

    await saveCachedMessages(
      roomId: roomId,
      messages: current,
    );
  }

  Future<void> removeCachedMessage({
    required String roomId,
    required String messageId,
  }) async {
    final current = await getCachedMessages(roomId);

    current.removeWhere((e) => e.id == messageId);

    await saveCachedMessages(
      roomId: roomId,
      messages: current,
    );
  }

  Future<void> clear(String roomId) async {
    await _box.delete(_key(roomId));
  }
}