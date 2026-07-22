import 'package:flutter/foundation.dart';
import '../storage/secure_storage_service.dart';

/// держит текущий статус авторизации и оповещает GoRouter
/// (через refreshListenable) при login/logout, чтобы редиректы пересчитались
class AuthStateNotifier extends ChangeNotifier {
  final SecureStorageService _secureStorageService;

  AuthStateNotifier(this._secureStorageService);

  bool _isAuthenticated = false;
  bool _isInitialized = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isInitialized => _isInitialized;

  /// вызывается один раз при старте приложения
  Future<void> init() async {
    final token = await _secureStorageService.getAccessToken();
    _isAuthenticated = token != null;
    _isInitialized = true;
    notifyListeners();
  }

  /// вызывается после успешного login/register,
  /// когда с бэка пришли оба токена
  Future<void> logIn({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorageService.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logOut() async {
    await _secureStorageService.deleteTokens();
    _isAuthenticated = false;
    notifyListeners();
  }
}