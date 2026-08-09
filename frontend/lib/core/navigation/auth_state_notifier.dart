import 'package:flutter/foundation.dart';
import '../storage/secure_storage_service.dart';
import '../storage/web_token_holder.dart';
import '../storage/hive_service.dart';
import '../network/socket_service.dart';
import '../services/unread_rooms_counter.dart';
import '../../features/auth/domain/interfaces/i_auth_repository.dart';

/// держит текущий статус авторизации и оповещает GoRouter
/// (через refreshListenable) при login/logout, чтобы редиректы пересчитались
class AuthStateNotifier extends ChangeNotifier {
  final SecureStorageService _secureStorageService; // мобилка
  final WebTokenHolder _webTokenHolder; // веб
  final HiveService _hiveService;
  final SocketService _socketService;
  final UnreadRoomsCounter _unreadRoomsCounter;
  final IAuthRepository _authRepository;

  AuthStateNotifier(
    this._secureStorageService,
    this._webTokenHolder,
    this._hiveService,
    this._socketService,
    this._unreadRoomsCounter,
    this._authRepository,
  );

  bool _isAuthenticated = false;
  bool _isInitialized = false;
  String? _currentUserId;

  bool get isAuthenticated => _isAuthenticated;
  bool get isInitialized => _isInitialized;
  String? get currentUserId => _currentUserId;

  /// вызывается один раз при старте приложения
  Future<void> init() async {
    if (kIsWeb) {
      // WebTokenHolder пуст после перезагрузки страницы (живёт только в памяти),
      // поэтому пробуем восстановить сессию через httpOnly refresh cookie
      final restored = await _tryRestoreWebSession();
      _isAuthenticated = restored;
    } else {
      final token = await _secureStorageService.getAccessToken();
      final userId = await _secureStorageService.getUserId();
      _isAuthenticated = token != null;
      _currentUserId = userId;

      // если юзер уже был залогинен (токен есть) — поднимаем сокет сразу при старте
      if (token != null) {
        _socketService.connect(token);
      }
    }

    _isInitialized = true;
    _unreadRoomsCounter.reset();

    notifyListeners();
  }

  // дергает /auth/refresh на старте веб-приложения. возвращает true если сессия восстановлена
  Future<bool> _tryRestoreWebSession() async {
    final result = await _authRepository.restoreWebSession();
    return result.fold(
      (failure) => false, // нет активной сессии — это нормально, просто не логиним
      (accessToken) {
        _socketService.connect(accessToken.user.id);
        _currentUserId = accessToken.user.id;
        return true;
      },
    );
  }

  /// вызывается после успешного login/register
  Future<void> logIn({
    required String accessToken,
    String? refreshToken,
    required String userId,
  }) async {
    if (kIsWeb) {
      _webTokenHolder.saveAccessToken(accessToken);
    } else {
      if (refreshToken == null) {
        throw ArgumentError('Refresh token обязателен для мобильного клиента');
      }
      await _secureStorageService.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
      await _secureStorageService.saveUserId(userId);
    }

    _isAuthenticated = true;
    _currentUserId = userId;
    _socketService.connect(accessToken);
    notifyListeners();
  }

  Future<void> logOut() async {
    if (kIsWeb) {
      _webTokenHolder.clear();
      // серверный logout (очистка cookie) дергается отдельно
    } else {
      await _secureStorageService.deleteTokens();
    }

    _socketService.disconnect();

    // чистим локальный кэш, чтобы при входе другого юзера на этом же устройстве
    // не мелькнули чужие данные до первого успешного запроса к серверу
    await _hiveService.clearAll();

    _isAuthenticated = false;
    _currentUserId = null;
    _unreadRoomsCounter.reset();

    notifyListeners();
  }
}