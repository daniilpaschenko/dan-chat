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

    final iconSize = spacing.isDesktop ? 26.0 : spacing.buttonIconSize;
    final textSize = spacing.isDesktop ? 14.0 : spacing.buttonTextSize;
    final vPadding = spacing.isDesktop ? 18.0 : spacing.buttonVerticalPadding;

    return Material(
      color: AppColors.surfaceVariant,
      borderRadius: BorderRadius.circular(spacing.buttonRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(spacing.buttonRadius),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: vPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primary, size: iconSize),
              SizedBox(height: spacing.small),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textPrimary, fontSize: textSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}