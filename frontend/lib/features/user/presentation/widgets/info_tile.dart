import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

Future<void> _copyToClipboard(BuildContext context) async {
  await Clipboard.setData(ClipboardData(text: value));

  if (context.mounted) {
    final message = switch (label) {
      'Почта' => 'Почта скопирована',
      'Имя пользователя' => 'Имя пользователя скопировано',
      _ => '$label скопировано',
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _copyToClipboard(context),
        borderRadius: BorderRadius.circular(spacing.infoRadius),
        child: Container(
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
        ),
      ),
    );
  }
}