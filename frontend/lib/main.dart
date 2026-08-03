import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/di/injection_container.dart';
import 'core/navigation/auth_state_notifier.dart';
import 'core/storage/hive_service.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();
  await getIt<HiveService>().init();
  await getIt<AuthStateNotifier>().init(); // проверяет токен до первого билда UI

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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