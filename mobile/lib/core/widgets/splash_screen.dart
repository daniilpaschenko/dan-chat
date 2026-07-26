import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// показывается пока идёт чтение токена из secure storage. без логики, просто индикатор загрузки
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
    );
  }
}