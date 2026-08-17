import 'dart:async';
import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'local_notification_service.dart';
import '../network/socket_service.dart';
import '../navigation/app_router.dart';
import '../navigation/route_paths.dart';

class PushService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final LocalNotificationService _localNotificationService;
  final SocketService _socketService;
  final String? Function() _getCurrentUserId; // геттер, а не значение — читаем лениво на момент события

  StreamSubscription<Map<String, dynamic>>? _messageNewSub;

  PushService(this._localNotificationService, this._socketService, this._getCurrentUserId);

  Future<void> init({
    required Future<void> Function(String token, String platform) onTokenReady,
  }) async {
    final settings = await _messaging.requestPermission();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    final token = kIsWeb
        ? await _messaging.getToken(vapidKey: 'BODa1Hp83ONdgK-hhQ2VB1yWZz8-EzMnPwLZnihHCNND7RVZ1zDEQGGAPBfZm_tcMTnnq5gNmPkzQomv6ePT4pY')
        : await _messaging.getToken();

    if (token != null) {
      await onTokenReady(token, _currentPlatform);
    }

    // если токен обновится (например, после переустановки) — тоже шлём на бэк
    _messaging.onTokenRefresh.listen((newToken) => onTokenReady(newToken, _currentPlatform));

    // приложение открыто — сами рисуем баннер через local_notifications
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification != null) {
        _localNotificationService.show(
          title: notification.title ?? '',
          body: notification.body ?? '',
          data: message.data,
        );
      }
    });

    // бэкенд намеренно не шлёт push тем, кто онлайн по сокету
    // поэтому для онлайн-юзеров локальное уведомление рисуем сами по сокет-событию
    _messageNewSub = _socketService.messageNew$.listen((data) {
      // TODO: не показывать, если сейчас открыт именно этот roomId (экран чата)
      final sender = data['sender'] as Map<String, dynamic>?;
      final senderId = (sender?['_id'] ?? sender?['id'])?.toString();
      final currentUserId = _getCurrentUserId();

      // сервер шлёт message:new всем участникам комнаты, включая самого отправителя
      // (чтобы у него тоже обновился список сообщений) — уведомление ему самому не нужно
      if (senderId != null && senderId == currentUserId) return;

      final roomId = (data['room'] ?? data['roomId'])?.toString();

      _localNotificationService.show(
        title: sender?['username']?.toString() ?? '',
        body: data['text']?.toString() ?? '',
        data: {
          'type': 'message',
          'roomId': roomId,
        },
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
        ? _messaging.getToken(vapidKey: 'BODa1Hp83ONdgK-hhQ2VB1yWZz8-EzMnPwLZnihHCNND7RVZ1zDEQGGAPBfZm_tcMTnnq5gNmPkzQomv6ePT4pY')
        : _messaging.getToken();
  }

  Future<void> deleteToken() => _messaging.deleteToken();

  void dispose() {
    _messageNewSub?.cancel();
  }
}