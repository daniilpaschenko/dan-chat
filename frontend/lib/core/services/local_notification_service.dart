import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_ce/hive.dart';
import 'dart:convert';

class LocalNotificationService {
  final _plugin = FlutterLocalNotificationsPlugin();
  void Function(String payload)? onNotificationTap; // колбэк

  static const _boxName = 'notification_lines'; // хранит накопленные строки сообщений по roomId

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
    // тогда несколько уведомлений из одной комнаты попадут в одну "стопку" вместо новой пуш-карточки.
    // если roomId нет — используем время, чтобы не схлопывать разные уведомления между собой.
    final id = roomId != null ? _idForRoom(roomId) : DateTime.now().millisecondsSinceEpoch ~/ 1000;

    StyleInformation? style;
    String displayBody = body;

    if (roomId != null) {
      // копим строки для этой комнаты в Hive (а не в памяти), потому что
      // это же уведомление может показываться и из background-изолейта (FCM background handler)
      // у которого нет доступа к состоянию основного изолейта
      final lines = await _appendLine(roomId, body);

      style = InboxStyleInformation(
        lines, // каждое сообщение — отдельная строка в развёрнутом виде
        contentTitle: title,
        summaryText: lines.length > 1 ? '${lines.length} новых сообщений' : null,
      );
      // в свёрнутом виде показываем последнее сообщение, либо счётчик, если их несколько
      displayBody = lines.length > 1 ? '${lines.length} новых сообщений' : body;
    }

    await _plugin.show(
      id: id,
      title: title,
      body: displayBody,
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
    await _plugin.cancel(id: _idForRoom(roomId)); // id — позиционный параметр, не именованный
    await _clearLines(roomId);
  }

  // детерминированный id уведомления для комнаты
  int _idForRoom(String roomId) => roomId.hashCode & 0x7fffffff; // положительный int32

  String _linesKey(String roomId) => 'notif_lines_$roomId';

  // box открываем и сразу закрываем на каждую операцию, а не держим открытым
  // открывая/закрывая box на каждый вызов, мы гарантируем, что каждый изолят видит
  // актуальное состояние и сразу освобождает файл
  Future<T> _withBox<T>(Future<T> Function(Box<List> box) action) async {
    final box = Hive.isBoxOpen(_boxName) ? Hive.box<List>(_boxName) : await Hive.openBox<List>(_boxName);
    try {
      return await action(box);
    } finally {
      await box.close();
    }
  }

  Future<List<String>> _appendLine(String roomId, String line) {
    return _withBox((box) async {
      final key = _linesKey(roomId);
      final lines = (box.get(key)?.cast<String>().toList() ?? <String>[])..add(line);
      await box.put(key, lines);
      return lines;
    });
  }

  Future<void> _clearLines(String roomId) {
    return _withBox((box) => box.delete(_linesKey(roomId)));
  }
}