import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConstants {
  ApiConstants._();

  static const String _apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://localhost:3000',
  );

  static String get baseUrl => '$_apiUrl/api';

  static String get socketUrl => _apiUrl;

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  static const String clientTypeHeader = 'X-Client-Type';

  static String get clientType => kIsWeb ? 'web' : 'mobile';
}