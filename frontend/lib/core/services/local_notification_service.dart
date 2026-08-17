import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';

class LocalNotificationService {
  final _plugin = FlutterLocalNotificationsPlugin();
  void Function(String payload)? onNotificationTap; // колбэк

  static const _channel = AndroidNotificationChannel(
    'messages_channel', // id канала
    'Сообщения', // видимое юзеру название в настройках Android
    description: 'Уведомления о новых сообщениях в чате',
    importance: Importance.high,
  );

  Future<void> init() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);

    await _plugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload != null) onNotificationTap?.call(payload);
      },
    );

    await _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
  }

  Future<void> show({required String title, required String body, Map<String, dynamic>? data}) async {
    await _plugin.show(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000, // уникальный id
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      payload: data != null ? jsonEncode(data) : null,
    );
  }
}