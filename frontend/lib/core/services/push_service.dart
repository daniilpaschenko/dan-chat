import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class PushService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> init({
    required Future<void> Function(String token, String platform) onTokenReady,
  }) async {
    final settings = await _messaging.requestPermission();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    final token = kIsWeb
        ? await _messaging.getToken(vapidKey: 'BODa1Hp83ONdgK-hhQ2VB1yWZz8-EzMnPwLZnihHCNND7RVZ1zDEQGGAPBfZm_tcMTnnq5gNmPkzQomv6ePT4pY')
        : await _messaging.getToken();

    if (token == null) return;

    await onTokenReady(token, _currentPlatform);

    // если токен обновится (например, после переустановки) — тоже шлём на бэк
    _messaging.onTokenRefresh.listen((newToken) => onTokenReady(newToken, _currentPlatform));
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
}