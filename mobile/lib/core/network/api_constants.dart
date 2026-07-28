class ApiConstants {
  ApiConstants._();
  // для моего девайса
  // adb reverse tcp:3000 tcp:3000
  // static const String baseUrl = 'http://localhost:3000/api';

  // для андроид-эмулятора
  static const String baseUrl = 'http://10.0.2.2:3000/api';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
}