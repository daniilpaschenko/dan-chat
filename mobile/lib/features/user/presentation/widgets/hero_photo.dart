import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

class HeroPhoto extends StatelessWidget {
  final String? avatarUrl;
  final String fallbackLetter;
  final double height;
  final bool isUploading;

  const HeroPhoto({
    super.key,
    required this.avatarUrl,
    required this.fallbackLetter,
    required this.height,
    required this.isUploading,
  });

  String get _letter => fallbackLetter.isNotEmpty ? fallbackLetter[0].toUpperCase() : '?';

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(spacing.heroRadius),
            child: avatarUrl != null
                ? Image.network(
                    avatarUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => _fallback(context),
                  )
                : _fallback(context),
          ),
          if (isUploading)
            const ColoredBox(
              color: Colors.black45,
              child: Center(child: CircularProgressIndicator()),
            ),
          // Блок с кнопкой назад полностью удален отсюда
        ],
      ),
    );
  }

  Widget _fallback(BuildContext context) {
    final spacing = AppSpacing.of(context);
    return Container(
      color: AppColors.primary,
      alignment: Alignment.center,
      child: Text(
        _letter,
        style: TextStyle(
          color: AppColors.textPrimary, 
          fontSize: spacing.heroLetterSize, 
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}