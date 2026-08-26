import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/di/injection_container.dart';
import 'core/navigation/auth_state_notifier.dart';
import 'core/storage/hive_service.dart';
import 'core/network/socket_service.dart';
import 'core/network/connectivity_service.dart';
import 'core/theme/app_theme.dart';
import 'core/services/local_notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setupDependencies();
  await getIt<HiveService>().init();
  await getIt<ConnectivityService>().init();
  await getIt<AuthStateNotifier>().init(); // проверяет токен до первого билда UI
  await getIt<LocalNotificationService>().init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// слушаем жизненный цикл приложения, чтобы при сворачивании/выходе из приложения отключать сокет, а при возврате — подключать
class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // paused — реально ушли в фон (свернули/переключились на другое приложение)
  // detached — приложение уничтожается
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (kIsWeb) return; // на вебе не рвём сокет по видимости вкладки
    
    final socketService = getIt<SocketService>();
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        socketService.pause();
        break;
      case AppLifecycleState.resumed:
        socketService.resume();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DAN',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: getIt<GoRouter>(),
    );
  }
}