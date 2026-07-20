import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../di/injection_container.dart';
import '../navigation/auth_state_notifier.dart';
import '../navigation/route_paths.dart';

/// заглушка для экранов, которых ещё нет
/// cдержит кнопку "Выйти"
/// убрать, когда появятся реальные экраны
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width.clamp(0.0, 600.0);
    final double titleSize = screenW * 0.05;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Экран в разработке',
              style: TextStyle(fontSize: titleSize),
            ),
            const SizedBox(height: 24),
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