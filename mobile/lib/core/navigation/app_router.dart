import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../widgets/placeholder_screen.dart';
import 'auth_state_notifier.dart';
import 'route_paths.dart';

class AppRouter {
  final AuthStateNotifier _authStateNotifier;

  AppRouter(this._authStateNotifier);

  GoRouter build() {
    return GoRouter(
      initialLocation: RoutePaths.login,
      refreshListenable: _authStateNotifier,
      redirect: (context, state) {
        final isAuthenticated = _authStateNotifier.isAuthenticated;
        final isAuthRoute = state.matchedLocation == RoutePaths.login ||
            state.matchedLocation == RoutePaths.register;

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
          path: RoutePaths.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RoutePaths.register,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: RoutePaths.chatList,
          builder: (context, state) => const PlaceholderScreen(
            title: 'Чаты',
          ),
        ),
        GoRoute(
          path: RoutePaths.chatRoom,
          builder: (context, state) {
            final roomId = state.pathParameters['roomId']!;
            return PlaceholderScreen(title: 'Комната: $roomId');
          },
        ),
      ],
    );
  }
}