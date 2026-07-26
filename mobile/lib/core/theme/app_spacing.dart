import 'package:flutter/material.dart';

// responsive отступы, зависящие от ширины экрана
class AppSpacing {
  final double screenW;
  final double titleSize;
  final double small;
  final double medium;
  final double form;

  const AppSpacing._({
    required this.screenW,
    required this.titleSize,
    required this.small,
    required this.medium,
    required this.form,
  });

  factory AppSpacing.of(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width.clamp(0.0, 600.0);
    return AppSpacing._(
      screenW: screenW,
      titleSize: screenW * 0.05,
      small: screenW * 0.03,
      medium: screenW * 0.08,
      form: screenW * 0.06,
    );
  }
}