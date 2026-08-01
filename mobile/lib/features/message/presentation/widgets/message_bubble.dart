import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/message_entity.dart';

class MessageBubble extends StatelessWidget {
  final MessageEntity message;
  final bool isMine;
  final double gap;
  final AppSpacing spacing;

  const MessageBubble({super.key, required this.message, required this.isMine, required this.gap, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Align(
      // если моё то справа, чужое — слева
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        // расстояние между сообщениями
        margin: EdgeInsets.symmetric(vertical: gap * 0.2),
        padding: EdgeInsets.symmetric(horizontal: gap, vertical: gap * 0.5),
        // пузырь не шире этого значения (для переносов)
        constraints: BoxConstraints(maxWidth: spacing.bubbleMaxWidth),
        decoration: BoxDecoration(
          // если сообщение моё то цвет primary, иначе — surface
          color: isMine ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(spacing.bubbleRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // занимает места ровно столько, сколько нужно потомкам
          mainAxisSize: MainAxisSize.min,
          children: [
            // если не моё сообщение
            if (!isMine)
              Padding(
                padding: EdgeInsets.only(bottom: gap * 0.2),
                child: Text(
                  // пишем еще и имя пользователя
                  message.sender.username,
                  style: TextStyle(
                    fontSize: spacing.captionSize,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            Text(
              message.text,
              style: TextStyle(color: isMine ? Colors.white : AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}