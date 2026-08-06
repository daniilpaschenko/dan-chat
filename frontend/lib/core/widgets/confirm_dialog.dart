import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// переиспользуемый диалог подтверждения деструктивного действия
// возвращает true, если пользователь подтвердил
Future<bool> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  String confirmText = 'Удалить',
  String cancelText = 'Отмена',
  bool isDestructive = true,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            confirmText,
            style: TextStyle(color: isDestructive ? AppColors.error : null),
          ),
        ),
      ],
    ),
  );
  return result ?? false;
}