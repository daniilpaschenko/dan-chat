import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';

class LocalNotificationService {
  final _plugin = FlutterLocalNotificationsPlugin();
  void Function(String payload)? onNotificationTap; // колбэк

  // копим строки сообщений по комнате, чтобы показывать их одним "стопкой"-уведомлением
  // (InboxStyle), а не затирать предыдущее новым
  final Map<String, List<String>> _linesByRoom = {};

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
    final roomId = data?['roomId']?.toString();

    // если уведомление привязано к комнате — используем детерминированный id (хэш roomId),
    // тогда несколько уведомлений из одной комнаты попадут в одну "стопку" вместо новой пуш-карточки
    // если roomId нет — используем время, чтобы не схлопывать разные уведомления между собой.
    final id = roomId != null ? _idForRoom(roomId) : DateTime.now().millisecondsSinceEpoch ~/ 1000;

    StyleInformation? style;
    if (roomId != null) {
      // копим строки для этой комнаты, пока юзер их не увидел (не зашёл в чат)
      final lines = _linesByRoom.putIfAbsent(roomId, () => []);
      lines.add(body);

      style = InboxStyleInformation(
        lines, // каждое сообщение — отдельная строка в развёрнутом виде
        contentTitle: title,
        summaryText: lines.length > 1 ? '${lines.length} новых сообщений' : null,
      );
    }

    await _plugin.show(
      id: id,
      title: title,
      // в свёрнутом виде показываем последнее сообщение, либо счётчик, если их несколько
      body: roomId != null && (_linesByRoom[roomId]?.length ?? 0) > 1
          ? '${_linesByRoom[roomId]!.length} новых сообщений'
          : body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.high,
          priority: Priority.high,
          styleInformation: style,
        ),
      ),
      payload: data != null ? jsonEncode(data) : null,
    );
  }

  // скрыть уведомление, относящееся к комнате roomId, и забыть накопленные строки
  Future<void> cancelForRoom(String roomId) async {
    await _plugin.cancel(id: _idForRoom(roomId));
    _linesByRoom.remove(roomId);
  }

  // детерминированный id уведомления для комнаты
  int _idForRoom(String roomId) => roomId.hashCode & 0x7fffffff; // положительный int32
}