import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

// подложка под текст статуса, чтобы он был читаемым на фото
class LastSeenLabel extends StatelessWidget {
  final String text;
  final AppSpacing spacing;

  const LastSeenLabel({super.key, required this.text, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing.small * 0.7, vertical: spacing.small * 0.3),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(spacing.small),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: spacing.captionSize,
        ),
      ),
    );
  }
}