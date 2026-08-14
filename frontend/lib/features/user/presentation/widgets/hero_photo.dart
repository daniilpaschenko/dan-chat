import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import 'lastseen_label.dart';

class HeroPhoto extends StatelessWidget {
  final String? avatarUrl;
  final String fallbackLetter;
  final double height;
  final bool isUploading;
  final String? statusText;
  final bool isDesktop;

  const HeroPhoto({
    super.key,
    required this.avatarUrl,
    required this.fallbackLetter,
    required this.height,
    required this.isUploading,
    this.statusText,
    this.isDesktop = false,
  });

  String get _letter => fallbackLetter.isNotEmpty ? fallbackLetter[0].toUpperCase() : '?';

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);

    if (isDesktop) {
      // квадратный аватар 1:1, ограниченный по размеру, по центру
      final side = height.clamp(0.0, 700.0);
      return Padding(
        padding: EdgeInsets.symmetric(vertical: spacing.medium / 2),
        child: Center(
          child: SizedBox(
            width: side,
            height: side,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(spacing.heroRadius),
                  child: avatarUrl != null
                      ? Image.network(
                          avatarUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => _fallback(context, fontSizeOverride: side * 0.4),
                        )
                      : _fallback(context, fontSizeOverride: side * 0.4),
                ),
                if (isUploading)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(spacing.heroRadius),
                    child: const ColoredBox(
                      color: Colors.black45,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                if (statusText != null)
                  Positioned(
                    left: spacing.small,
                    bottom: spacing.small,
                    child: LastSeenLabel(text: statusText!, spacing: spacing),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    // мобильная раскладка — без изменений
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
          if (statusText != null)
            Positioned(
              left: spacing.small,
              bottom: spacing.small,
              child: LastSeenLabel(text: statusText!, spacing: spacing),
            ),
        ],
      ),
    );
  }

  Widget _fallback(BuildContext context, {double? fontSizeOverride}) {
    final spacing = AppSpacing.of(context);
    return Container(
      color: AppColors.primary,
      alignment: Alignment.center,
      child: Text(
        _letter,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: fontSizeOverride ?? spacing.heroLetterSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}