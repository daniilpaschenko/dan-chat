import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../di/injection_container.dart';
import '../navigation/auth_state_notifier.dart';
import '../navigation/route_paths.dart';
import '../theme/app_spacing.dart';

/// заглушка для экранов, которых ещё нет
/// cдержит кнопку "Выйти"
/// убрать, когда появятся реальные экраны
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Экран в разработке',
              style: TextStyle(fontSize: spacing.titleSize),
            ),
            SizedBox(height: spacing.medium),
            ElevatedButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(RoutePaths.chatList);
                }
              },
              child: const Text('Назад'),
            ),
            SizedBox(height: spacing.medium),
            ElevatedButton(
              onPressed: () async {
                await getIt<AuthStateNotifier>().logOut();
                if (context.mounted) context.go(RoutePaths.login);
              },
              child: const Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}