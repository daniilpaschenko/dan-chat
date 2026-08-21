import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

// разделитель дней в чате
class ChatDateDivider extends StatelessWidget {
  final DateTime date;
  final AppSpacing spacing;

  const ChatDateDivider({
    super.key,
    required this.date,
    required this.spacing,
  });

  static const _months = [
    'января', 'февраля', 'марта', 'апреля', 'мая', 'июня',
    'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря',
  ];

  // текстовая метка для даты
  static String label(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    final diff = today.difference(target).inDays;

    if (diff == 0) return 'сегодня';
    if (diff == 1) return 'вчера';

    final month = _months[target.month - 1];
    if (target.year == today.year) {
      return '${target.day} $month';
    }
    return '${target.day} $month ${target.year} года';
  }

  // ключ группировки сообщений по дню
  static String dayKey(DateTime date) => '${date.year}-${date.month}-${date.day}';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: spacing.small * 0.4),
        padding: EdgeInsets.symmetric(horizontal: spacing.small, vertical: spacing.small * 0.4),
        decoration: BoxDecoration(
          color: AppColors.divider,
          borderRadius: BorderRadius.circular(spacing.bubbleRadius),
        ),
        child: Text(
          label(date),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: spacing.captionSize, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}