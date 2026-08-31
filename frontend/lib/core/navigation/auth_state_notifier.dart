import 'package:flutter/foundation.dart';
import '../storage/secure_storage_service.dart';
import '../storage/web_token_holder.dart';
import '../storage/hive_service.dart';
import '../network/socket_service.dart';
import '../services/unread_rooms_counter.dart';
import '../services/push_service.dart';
import '../../features/auth/domain/interfaces/i_auth_repository.dart';
import '../../features/user/domain/usecases/save_device_token_usecase.dart';
import '../../features/user/domain/usecases/remove_device_token_usecase.dart';

/// держит текущий статус авторизации и оповещает GoRouter
/// (через refreshListenable) при login/logout, чтобы редиректы пересчитались
class AuthStateNotifier extends ChangeNotifier {
  final SecureStorageService _secureStorageService; // мобилка
  final WebTokenHolder _webTokenHolder; // веб
  final HiveService _hiveService;
  final SocketService _socketService;
  final UnreadRoomsCounter _unreadRoomsCounter;
  final IAuthRepository _authRepository;
  final PushService _pushService;
  final SaveDeviceTokenUseCase _saveDeviceTokenUseCase;
  final RemoveDeviceTokenUseCase _removeDeviceTokenUseCase;

  AuthStateNotifier(
    this._secureStorageService,
    this._webTokenHolder,
    this._hiveService,
    this._socketService,
    this._unreadRoomsCounter,
    this._authRepository,
    this._pushService,
    this._saveDeviceTokenUseCase,
    this._removeDeviceTokenUseCase,
  ) {
    _socketService.authFailed$.listen((_) {
      logOut();
    });
  }

  bool _isAuthenticated = false;
  bool _isInitialized = false;
  String? _currentUserId;

  bool get isAuthenticated => _isAuthenticated;
  bool get isInitialized => _isInitialized;
  String? get currentUserId => _currentUserId;

  // защита от повторных вызовов init() — на вебе без гварда
  // каждый вызов запускал бы свой поход за /auth/refresh
  Future<void>? _initFuture;

  // защита от повторных параллельных вызовов restore — если несколько мест
  // одновременно попросят восстановить сессию, реальный запрос уйдёт один раз
  Future<bool>? _restoreSessionFuture;

  // защита от рекурсии: onAuthFailure -> logOut()
  bool _isLoggingOut = false;

  // инициализация push-уведомлений: получаем токен и сохраняем на бэкенде
  // вынес в отдельный метод
  void _initPush() {
    _pushService.init(
      onTokenReady: (token, platform) async {
        final result = await _saveDeviceTokenUseCase(token: token, platform: platform);
        result.fold(
          (failure) => debugPrint('push token save failed: $failure'),
          (_) => null,
        );
      },
    );
  }

  /// вызывается один раз при старте приложения
  Future<void> init() {
    // если init() уже запущен (или завершён) — отдаём тот же Future, а не стартуем процесс заново
    return _initFuture ??= _doInit();
  }

  Future<void> _doInit() async {
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
        _initPush();
      }
    }

    _isInitialized = true;
    _unreadRoomsCounter.reset();

    notifyListeners();
  }

  // дергает /auth/refresh на старте веб-приложения. возвращает true если сессия восстановлена
  Future<bool> _tryRestoreWebSession() {
    return _restoreSessionFuture ??= _doTryRestoreWebSession();
  }

  Future<bool> _doTryRestoreWebSession() async {
    final result = await _authRepository.restoreWebSession();
    return result.fold(
      (failure) => false,
      (authEntity) {
        _socketService.connect(authEntity.accessToken);
        _currentUserId = authEntity.user.id;
        _initPush();
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
    _initPush();
    notifyListeners();
  }

  Future<void> logOut() async {
    // если мы и так не залогинены – не лезем в сеть за удалением push-токена
    // чтобы не словить 401 и не зациклиться через onAuthFailure -> logOut()
    if (!_isAuthenticated) return;

    // защита от повторного/рекурсивного входа, если logOut() дёрнут ещё раз, пока предыдущий вызов ещё не завершился
    if (_isLoggingOut) return;
    _isLoggingOut = true;

    try {
      // забираем push-токен и чистим его на бэкенде ДО очистки локального хранилища,
      // иначе после logout юзер продолжит получать чужие уведомления на этом устройстве
      final deviceToken = await _pushService.getCurrentToken();
      if (deviceToken != null) {
        try {
          await _removeDeviceTokenUseCase(deviceToken);
        } catch (_) {
          // не блокируем сам логаут, если чистка push-токена не удалась —
          // локальное состояние всё равно должно очиститься
        }
      }

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

      // сбрасываем кэш restore-сессии, чтобы следующий init() мог восстановить сессию заново
      _restoreSessionFuture = null;

      notifyListeners();
    } finally {
      _isLoggingOut = false;
    }
  }
}