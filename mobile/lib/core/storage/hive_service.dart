import 'package:hive_ce_flutter/hive_flutter.dart';

/// регистрировать TypeAdapter'ы перед открытием боксов
class HiveService {
  static const String roomsBoxName = 'rooms_box';
  static const String messagesBoxName = 'messages_box';

  Future<void> init() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(RoomModelAdapter());
    // Hive.registerAdapter(MessageModelAdapter());
  }
}