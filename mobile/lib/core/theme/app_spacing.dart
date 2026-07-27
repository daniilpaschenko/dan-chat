import 'package:flutter/material.dart';

// responsive отступы, зависящие от ширины экрана
class AppSpacing {
  final double screenW;
  final double titleSize;
  final double small;
  final double medium;
  final double form;

  // раньше были захардкожены прямо в chat_room_screen.dart
  final double loaderSize;
  final double bubbleRadius;
  final double inputRadius;
  final double bubbleMaxWidth;
  final double captionSize;

  const AppSpacing._({
    required this.screenW,
    required this.titleSize,
    required this.small,
    required this.medium,
    required this.form,
    required this.loaderSize,
    required this.bubbleRadius,
    required this.inputRadius,
    required this.bubbleMaxWidth,
    required this.captionSize,
  });

  factory AppSpacing.of(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width.clamp(0.0, 600.0);
    return AppSpacing._(
      screenW: screenW,
      titleSize: screenW * 0.05,
      small: screenW * 0.03,
      medium: screenW * 0.08,
      form: screenW * 0.06,
      loaderSize: screenW * 0.05,
      bubbleRadius: screenW * 0.04,
      inputRadius: screenW * 0.06,
      bubbleMaxWidth: screenW * 0.75,
      captionSize: screenW * 0.0275,
    );
  }
}