import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/room/presentation/screens/room_list_screen.dart';
import '../widgets/placeholder_screen.dart';
import '../widgets/splash_screen.dart';
import 'auth_state_notifier.dart';
import 'route_paths.dart';

class AppRouter {
  final AuthStateNotifier _authStateNotifier;

  AppRouter(this._authStateNotifier);

  GoRouter build() {
    return GoRouter(
      initialLocation: RoutePaths.splash,
      refreshListenable: _authStateNotifier,
      redirect: (context, state) {
        final isInitialized = _authStateNotifier.isInitialized;
        final isAuthenticated = _authStateNotifier.isAuthenticated;
        final isSplashRoute = state.matchedLocation == RoutePaths.splash;
        final isAuthRoute = state.matchedLocation == RoutePaths.login ||
            state.matchedLocation == RoutePaths.register;

        // пока init() ещё не завершился (идёт чтение токена из secure storage) —
        // держим юзера на splash и никуда не редиректим, чтобы не было мигания
        // login -> chatList при холодном старте с валидным токеном
        if (!isInitialized) {
          return isSplashRoute ? null : RoutePaths.splash;
        }

        // init() завершился
        if (isSplashRoute) {
          return isAuthenticated ? RoutePaths.chatList : RoutePaths.login;
        }

        if (!isAuthenticated && !isAuthRoute) {
          return RoutePaths.login;
        }
        if (isAuthenticated && isAuthRoute) {
          return RoutePaths.chatList;
        }

        return null;
      },
      routes: [
        GoRoute(
          path: RoutePaths.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: RoutePaths.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RoutePaths.register,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: RoutePaths.chatList,
          builder: (context, state) => const RoomListScreen(),
        ),
        GoRoute(
          path: RoutePaths.chatRoom,
          builder: (context, state) {
            final roomId = state.pathParameters['roomId']!;
            return PlaceholderScreen(title: 'Комната: $roomId');
          },
        ),
        GoRoute(
          path: RoutePaths.search,
          builder: (context, state) => const PlaceholderScreen(
            title: 'Поиск',
          ),
        ),
        GoRoute(
          path: RoutePaths.profile,
          builder: (context, state) => const PlaceholderScreen(
            title: 'Профиль',
          ),
        ),
        GoRoute(
          path: RoutePaths.userProfile,
          builder: (context, state) => const PlaceholderScreen(
            title: 'Профиль другого пользователя',
          ),
        ),
      ],
    );
  }
}