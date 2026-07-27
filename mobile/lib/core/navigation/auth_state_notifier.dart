import 'package:flutter/foundation.dart';
import '../storage/secure_storage_service.dart';
import '../storage/hive_service.dart';

/// держит текущий статус авторизации и оповещает GoRouter
/// (через refreshListenable) при login/logout, чтобы редиректы пересчитались
class AuthStateNotifier extends ChangeNotifier {
  final SecureStorageService _secureStorageService;
  final HiveService _hiveService;

  AuthStateNotifier(this._secureStorageService, this._hiveService);

  bool _isAuthenticated = false;
  bool _isInitialized = false;
  String? _currentUserId;

  bool get isAuthenticated => _isAuthenticated;
  bool get isInitialized => _isInitialized;
  String? get currentUserId => _currentUserId;

  /// вызывается один раз при старте приложения
  Future<void> init() async {
    final token = await _secureStorageService.getAccessToken();
    final userId = await _secureStorageService.getUserId();
    _isAuthenticated = token != null;
    _currentUserId = userId;
    _isInitialized = true;
    notifyListeners();
  }


  /// вызывается после успешного login/register, когда с бэка пришли оба токена
  Future<void> logIn({
    required String accessToken,
    required String refreshToken,
    required String userId,
  }) async {
    await _secureStorageService.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    await _secureStorageService.saveUserId(userId);
    _isAuthenticated = true;
    _currentUserId = userId;
    notifyListeners();
  }

  Future<void> logOut() async {
    await _secureStorageService.deleteTokens();

    // чистим локальный кэш, чтобы при входе другого юзера на этом же устройстве
    // не мелькнули чужие данные до первого успешного запроса к серверу
    await _hiveService.clearAll();

    _isAuthenticated = false;
    _currentUserId = null;
    notifyListeners();
  }
}