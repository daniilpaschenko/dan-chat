import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConstants {
  ApiConstants._();
  
  static String get baseUrl =>
    kIsWeb ? 'http://localhost:3000/api' : 'http://10.241.97.197:3000/api';
  static String get socketUrl =>
    kIsWeb ? 'http://localhost:3000' : 'http://10.241.97.197:3000';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  static const String clientTypeHeader = 'X-Client-Type';
  static String get clientType => kIsWeb ? 'web' : 'mobile';
}