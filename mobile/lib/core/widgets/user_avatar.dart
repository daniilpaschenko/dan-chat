import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_colors.dart';

// круглая аватарка: картинка по avatarUrl, либо первая буква fallbackLetter на цветном фоне
class UserAvatar extends StatelessWidget {
  final String? avatarUrl;
  final String fallbackLetter;
  final double size;
  final double? fontSize;

  const UserAvatar({
    super.key,
    required this.avatarUrl,
    required this.fallbackLetter,
    required this.size,
    this.fontSize,
  });

  String get _letter => fallbackLetter.isNotEmpty ? fallbackLetter[0].toUpperCase() : '?';

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: avatarUrl != null
          ? CachedNetworkImage(
              imageUrl: avatarUrl!,
              width: size,
              height: size,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: size,
                height: size,
                color: AppColors.primary,
              ),
              errorWidget: (context, url, error) => _Fallback(letter: _letter, size: size, fontSize: fontSize),
            )
          : _Fallback(letter: _letter, size: size, fontSize: fontSize),
    );
  }
}

class _Fallback extends StatelessWidget {
  final String letter;
  final double size;
  final double? fontSize;

  const _Fallback({required this.letter, required this.size, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: AppColors.primary,
      child: Text(
        letter,
        style: fontSize != null
            ? TextStyle(fontSize: fontSize, color: AppColors.textPrimary, fontWeight: FontWeight.w600)
            : null,
      ),
    );
  }
}