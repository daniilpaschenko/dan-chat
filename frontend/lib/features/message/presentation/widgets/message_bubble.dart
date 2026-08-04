import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/message_entity.dart';

class MessageBubble extends StatelessWidget {
  final MessageEntity message;
  final bool isMine;
  final double gap;
  final AppSpacing spacing;
  final String? currentUserId;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMine,
    required this.gap,
    required this.spacing,
    required this.currentUserId,
  });

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
            if (message.createdAt != null)
              Padding(
                padding: EdgeInsets.only(top: gap * 0.2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatTime(message.createdAt!),
                      style: TextStyle(
                        fontSize: spacing.captionSize,
                        color: isMine ? Colors.white70 : AppColors.textSecondary,
                      ),
                    ),
                    if (isMine) ...[
                      SizedBox(width: gap * 0.25),
                      _buildStatusIcon(),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  // локальное время в формате HH:mm
  String _formatTime(DateTime dateTime) {
    final local = dateTime.toLocal();
    final hours = local.hour.toString().padLeft(2, '0');
    final minutes = local.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  Widget _buildStatusIcon() {
    final iconSize = spacing.captionSize * 1.1;

    switch (message.sendStatus) {
      case MessageSendStatus.sending:
        return Icon(Icons.access_time, size: iconSize, color: Colors.white70);

      case MessageSendStatus.failed:
        return Container(
          width: iconSize,
          height: iconSize,
          decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Text(
            '!',
            style: TextStyle(
              fontSize: iconSize * 0.75,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        );

      case MessageSendStatus.sent:
        final readByOthers = message.readBy.any((id) => id != currentUserId);
        return Icon(
          readByOthers ? Icons.done_all : Icons.done,
          size: iconSize,
          color: readByOthers ? Colors.lightBlueAccent : Colors.white70,
        );
    }
  }
}

