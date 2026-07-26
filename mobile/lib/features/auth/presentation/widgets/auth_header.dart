import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

/// иконка + "DAN" сверху формы
class AuthHeader extends StatelessWidget {
  final AppSpacing spacing;

  const AuthHeader({super.key, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.chat_bubble_rounded,
          size: spacing.titleSize * 2.2,
          color: AppColors.primary,
        ),
        SizedBox(height: spacing.small),
        Text(
          'DAN',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: spacing.titleSize,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}