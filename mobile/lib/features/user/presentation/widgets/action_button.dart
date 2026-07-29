import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    return Material(
      color: AppColors.surfaceVariant,
      borderRadius: BorderRadius.circular(spacing.buttonRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(spacing.buttonRadius),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: spacing.buttonVerticalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primary, size: spacing.buttonIconSize),
              const SizedBox(height: 6),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textPrimary, fontSize: spacing.buttonTextSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}