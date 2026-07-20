class ApiConstants {
  ApiConstants._();

  // TODO: поменять при переходе на тесты на мобилке
  // для Android-эмулятора localhost бэкенда — это 10.0.2.2, а не localhost
  static const String baseUrl = 'http://localhost:3000/api';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
}