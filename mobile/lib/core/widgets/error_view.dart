import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// сообщение об ошибке по центру экрана + кнопка "Повторить"
class ErrorView extends StatelessWidget {
  final String message;
  final double gap;
  final VoidCallback onRetry;

  const ErrorView({super.key, required this.message, required this.gap, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, style: const TextStyle(color: AppColors.textSecondary)),
          SizedBox(height: gap * 0.4),
          TextButton(onPressed: onRetry, child: const Text('Повторить')),
        ],
      ),
    );
  }
}