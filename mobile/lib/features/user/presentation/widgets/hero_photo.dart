import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import 'round_icon_button.dart';

class HeroPhoto extends StatelessWidget {
  final String? avatarUrl;
  final String fallbackLetter;
  final double height;
  final bool isUploading;
  final bool showBackButton;

  const HeroPhoto({
    super.key,
    required this.avatarUrl,
    required this.fallbackLetter,
    required this.height,
    required this.isUploading,
    required this.showBackButton,
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
          if (showBackButton)
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: spacing.backButtonPadding,
                  top: spacing.backButtonTopPadding,
                ),
                child: RoundIconButton(
                  icon: Icons.arrow_back,
                  onTap: () => context.pop(),
                ),
              ),
            ),
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
        style: TextStyle(color: AppColors.textPrimary, fontSize: spacing.heroLetterSize, fontWeight: FontWeight.w600),
      ),
    );
  }
}