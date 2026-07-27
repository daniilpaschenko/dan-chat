import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/room/presentation/screens/room_list_screen.dart';
import '../../features/user/presentation/screens/search_screen.dart';
import '../../features/message/presentation/screens/chat_room_screen.dart';
import '../navigation/app_shell.dart';
import '../../features/room/data/models/room.dart';
import '../widgets/placeholder_screen.dart';
import '../widgets/splash_screen.dart';
import 'auth_state_notifier.dart';
import 'route_paths.dart';

class AppRouter {
  final AuthStateNotifier _authStateNotifier;

  AppRouter(this._authStateNotifier);

  // root — для splash/auth/модальных экранов вне навбара, остальные — по одному на каждую вкладку боттом навбара
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _chatsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'chats');
  static final _searchNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'search');
  static final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

  GoRouter build() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
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

        // экраны вне навбара — открываются поверх текущего таба, без него
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: RoutePaths.chatRoom,
          builder: (context, state) => ChatRoomScreen(
            roomId: state.pathParameters['roomId']!,
            room: state.extra as RoomListItem?, 
          )
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: RoutePaths.userProfile,
          builder: (context, state) => const PlaceholderScreen(
            title: 'Профиль другого пользователя',
          ),
        ),

        // три вкладки с навбаром
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              navigatorKey: _chatsNavigatorKey,
              routes: [
                GoRoute(
                  path: RoutePaths.chatList,
                  builder: (context, state) => const RoomListScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _searchNavigatorKey,
              routes: [
                GoRoute(
                  path: RoutePaths.search,
                  builder: (context, state) => const SearchScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _profileNavigatorKey,
              routes: [
                GoRoute(
                  path: RoutePaths.profile,
                  builder: (context, state) => const PlaceholderScreen(
                    title: 'Профиль',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}