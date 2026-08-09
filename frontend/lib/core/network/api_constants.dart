import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConstants {
  ApiConstants._();
  
  // ДЛЯ УСТРОЙСТВ В МОЕЙ СЕТИ
  static const String baseUrl = 'http://192.168.1.10:3000/api';
  static const String socketUrl = 'http://192.168.1.10:3000';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  static const String clientTypeHeader = 'X-Client-Type';
  static String get clientType => kIsWeb ? 'web' : 'mobile';
}