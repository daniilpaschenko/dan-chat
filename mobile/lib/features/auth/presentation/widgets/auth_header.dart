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
        Image(
          image: AssetImage('assets/icons/icon_no_background_v1.png'),
          width: spacing.titleSize * 3.5,
          height: spacing.titleSize * 3.5,
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