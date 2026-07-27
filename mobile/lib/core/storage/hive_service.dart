import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveService {
  static const String roomsBoxName = 'rooms_box';
  static const String messagesBoxName = 'messages_box';
  static const String userBoxName = 'user_box'; // для профиля

  Future<void> init() async {
    await Hive.initFlutter();

    // храним закэшированные комнаты как JSON-строку
    await Hive.openBox(roomsBoxName);

    // сообщения
    await Hive.openBox(messagesBoxName);
    // await Hive.openBox(userBoxName);
  }

  // вызывается при logOut — чистим весь локальный кэш,
  // чтобы не было утечки данных между разными аккаунтами на одном устройстве
  Future<void> clearAll() async {
    await Hive.box(roomsBoxName).clear();
    await Hive.box(messagesBoxName).clear();
    
    // await Hive.box(userBoxName).clear();
  }
}