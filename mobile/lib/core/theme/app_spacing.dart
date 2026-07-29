import 'package:flutter/material.dart';

// responsive отступы, зависящие от ширины экрана
class AppSpacing {
  final double screenW;

  final double titleSize;
  final double small;
  final double medium;
  final double form;

  final double loaderSize;
  final double bubbleRadius;
  final double inputRadius;
  final double bubbleMaxWidth;
  final double captionSize;

  // profile
  final double pagePadding;
  final double heroRadius;
  final double heroLetterSize;
  final double buttonRadius;
  final double buttonVerticalPadding;
  final double buttonIconSize;
  final double buttonTextSize;
  final double buttonGap;
  final double infoRadius;
  final double infoHorizontalPadding;
  final double infoVerticalPadding;
  final double infoValueSize;
  final double infoLabelSize;
  final double backButtonPadding;
  final double backButtonTopPadding;
  final double errorGap;

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

    required this.pagePadding,
    required this.heroRadius,
    required this.heroLetterSize,
    required this.buttonRadius,
    required this.buttonVerticalPadding,
    required this.buttonIconSize,
    required this.buttonTextSize,
    required this.buttonGap,
    required this.infoRadius,
    required this.infoHorizontalPadding,
    required this.infoVerticalPadding,
    required this.infoValueSize,
    required this.infoLabelSize,
    required this.backButtonPadding,
    required this.backButtonTopPadding,
    required this.errorGap,
  });

  factory AppSpacing.of(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width.clamp(0.0, 600.0);

    return AppSpacing._(
      screenW: screenW,

      titleSize: screenW * .05,
      small: screenW * .03,
      medium: screenW * .08,
      form: screenW * .06,

      loaderSize: screenW * .05,
      bubbleRadius: screenW * .04,
      inputRadius: screenW * .06,
      bubbleMaxWidth: screenW * .75,
      captionSize: screenW * .0275,


      pagePadding: screenW * .04,
      heroRadius: screenW * .06,
      heroLetterSize: screenW * .16,

      buttonRadius: screenW * .035,
      buttonVerticalPadding: screenW * .035,
      buttonIconSize: screenW * .055,
      buttonTextSize: screenW * .03,
      buttonGap: screenW * .025,

      infoRadius: screenW * .03,
      infoHorizontalPadding: screenW * .04,
      infoVerticalPadding: screenW * .02,
      infoValueSize: screenW * .04,
      infoLabelSize: screenW * .032,

      backButtonPadding: screenW * .02,
      backButtonTopPadding: screenW * .01,

      errorGap: screenW * .06,
    );
  }
}