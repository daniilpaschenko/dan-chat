import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

class InfoTile extends StatelessWidget {
  final String value;
  final String label;

  const InfoTile({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(spacing.infoRadius),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: spacing.infoHorizontalPadding,
        vertical: spacing.infoVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: spacing.infoValueSize,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: spacing.infoLabelSize,
            ),
          ),
        ],
      ),
    );
  }
}