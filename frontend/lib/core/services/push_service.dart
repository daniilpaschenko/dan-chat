import 'dart:async';
import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'dart:io' show Platform;
import 'local_notification_service.dart';
import '../network/socket_service.dart';
import '../navigation/app_router.dart';
import '../navigation/route_paths.dart';
import '../../firebase_options.dart';

// отдельный top-level handler для пушей, пришедших пока приложение свёрнуто/убито
// Firebase запускает его в своём изолейте — там недоступны getIt/DI и состояние основного изолейта
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter(); // отдельный изолейт

  // data-only пуш: title/body лежат в data, а не в message.notification
  final title = message.data['title']?.toString();
  final body = message.data['body']?.toString();
  if (title == null && body == null) return;

  final localNotificationService = LocalNotificationService();
  await localNotificationService.init();
  await localNotificationService.show(
    title: title ?? '',
    body: body ?? '',
    data: message.data,
  );
}

class PushService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final LocalNotificationService _localNotificationService;
  final SocketService _socketService;
  final String? Function() _getCurrentUserId; // геттер, а не значение — читаем лениво на момент события

  StreamSubscription<Map<String, dynamic>>? _messageNewSub;

  // id комнаты, чей экран чата сейчас открыт (или null, если пользователь не в чате).
  // Устанавливается снаружи через enterChatRoom()/leaveChatRoom().
  String? _openRoomId;

  PushService(this._localNotificationService, this._socketService, this._getCurrentUserId);

  void enterChatRoom(String roomId) {
    _openRoomId = roomId;
    // на случай, если уведомление по этой комнате уже успело показаться —
    // прячем его, раз юзер и так сейчас в чате
    _localNotificationService.cancelForRoom(roomId);
  }

  void leaveChatRoom(String roomId) {
    if (_openRoomId == roomId) {
      _openRoomId = null;
    }
  }

  String _systemMessageText(Map<String, dynamic> data) {
    final sender = data['sender'] as Map<String, dynamic>?;
    final systemData = data['systemData'] as Map<String, dynamic>?;
    final target = systemData?['target'] as Map<String, dynamic>?;

    final actor = sender?['username']?.toString() ?? '';
    final targetName = target?['username']?.toString() ?? '';
    final action = systemData?['action']?.toString();

    switch (action) {
      case 'participant_added':
        return '$actor добавил(а) $targetName';
      case 'participant_removed':
        return '$actor удалил(а) $targetName';
      case 'participant_left':
        return '$actor вышел(а) из группы';
      case 'participant_promoted':
        return '$actor назначил(а) $targetName администратором';
      case 'participant_demoted':
        return '$actor понизил(а) $targetName до участника';
      default:
        return '';
    }
  }

  Future<void> init({
    required Future<void> Function(String token, String platform) onTokenReady,
  }) async {
    // регистрируем background handler до requestPermission()
    if (!kIsWeb) {
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    }

    final settings = await _messaging.requestPermission();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    final token = kIsWeb
        ? await _messaging.getToken(
            vapidKey:
                'BODa1Hp83ONdgK-hhQ2VB1yWZz8-EzMnPwLZnihHCNND7RVZ1zDEQGGAPBfZm_tcMTnnq5gNmPkzQomv6ePT4pY',
          )
        : await _messaging.getToken();

    if (token != null) {
      await onTokenReady(token, _currentPlatform);
    }

    // если токен обновится (например, после переустановки) — тоже шлём на бэк
    _messaging.onTokenRefresh.listen(
      (newToken) => onTokenReady(newToken, _currentPlatform),
    );

    // приложение открыто — сами рисуем баннер через local_notifications
    FirebaseMessaging.onMessage.listen((message) {
      // data-only пуш: title/body лежат в data, а не в message.notification
      final title = message.data['title']?.toString();
      final body = message.data['body']?.toString();
      if (title == null && body == null) return;

      final roomId = message.data['roomId']?.toString();
      // не показываем, если юзер сейчас и так сидит в этом чате
      if (roomId != null && roomId == _openRoomId) return;

      _localNotificationService.show(
        title: title ?? '',
        body: body ?? '',
        data: message.data,
      );
    });

    await _messageNewSub?.cancel();
    // бэкенд намеренно не шлёт push тем, кто онлайн по сокету
    // поэтому для онлайн-юзеров локальное уведомление рисуем сами по сокет-событию
    _messageNewSub = _socketService.messageNew$.listen((data) {
      final sender = data['sender'] as Map<String, dynamic>?;
      final senderId = (sender?['_id'] ?? sender?['id'])?.toString();
      final currentUserId = _getCurrentUserId();

      final roomId = (data['room'] ?? data['roomId'])?.toString();
      if (roomId != null && roomId == _openRoomId) return;

      final roomType = data['roomType']?.toString();
      final roomName = data['roomName']?.toString();
      final title = roomType == 'group'
          ? (roomName ?? '')
          : (sender?['username']?.toString() ?? '');

      final isSystem = data['type']?.toString() == 'system';

      if (isSystem && senderId == currentUserId) return; // не уведомляем актора о его же действии

      if (isSystem) {
        final body = _systemMessageText(data);
        if (body.isEmpty) return;

        _localNotificationService.show(
          title: title,
          body: body,
          data: {'type': 'message', 'roomId': roomId},
        );
        return;
      }

      // обычное текстовое сообщение — прежняя логика
      if (senderId != null && senderId == currentUserId) return;

      _localNotificationService.show(
        title: title,
        body: data['text']?.toString() ?? '',
        data: {'type': 'message', 'roomId': roomId},
      );
    });

    _localNotificationService.onNotificationTap = (payload) {
      final data = jsonDecode(payload) as Map<String, dynamic>;
      _handleNavigation(data);
    };

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNavigation(message.data);
    });

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNavigation(initialMessage.data);
    }
  }

  void _handleNavigation(Map<String, dynamic> data) {
    final type = data['type'];
    final roomId = data['roomId'] as String?;

    if (type == 'message' && roomId != null) {
      // достаём контекст из корневого навигатора напрямую, без DI на GoRouter
      final context = AppRouter.rootNavigatorKey.currentContext;
      if (context != null) {
        GoRouter.of(context).push(RoutePaths.chatRoomPath(roomId));
      }
    }
  }

  String get _currentPlatform {
    if (kIsWeb) return 'web';
    return Platform.isIOS ? 'ios' : 'android';
  }

  Future<String?> getCurrentToken() {
    return kIsWeb
        ? _messaging.getToken(
            vapidKey:
                'BODa1Hp83ONdgK-hhQ2VB1yWZz8-EzMnPwLZnihHCNND7RVZ1zDEQGGAPBfZm_tcMTnnq5gNmPkzQomv6ePT4pY',
          )
        : _messaging.getToken();
  }

  Future<void> deleteToken() => _messaging.deleteToken();

  void dispose() {
    _messageNewSub?.cancel();
  }
}
