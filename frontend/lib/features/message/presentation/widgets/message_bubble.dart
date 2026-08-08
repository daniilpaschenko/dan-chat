import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/user_avatar.dart';
import '../../../room/domain/entities/room_entity.dart';
import '../../domain/entities/message_entity.dart';

class MessageBubble extends StatelessWidget {
  final MessageEntity message;
  final bool isMine;
  final double gap;
  final AppSpacing spacing;
  final String? currentUserId;
  final RoomType roomType;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMine,
    required this.gap,
    required this.spacing,
    required this.currentUserId,
    required this.roomType,
  });

  // имя отправителя показываем только в группе и только у чужих сообщений
  bool get _showSenderName => !isMine && roomType == RoomType.group;

  // аватарку слева от бабла показываем тоже только в группе у чужих сообщений
  bool get _showAvatar => !isMine && roomType == RoomType.group;

  @override
  Widget build(BuildContext context) {
    final avatarSize = spacing.medium;

    final bubble = Container(
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
      child: IntrinsicWidth(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // занимает места ровно столько, сколько нужно потомкам
        mainAxisSize: MainAxisSize.min,
        children: [
          // имя пользователя показываем только в группе у чужих сообщений
          if (_showSenderName)
            Padding(
              padding: EdgeInsets.only(bottom: gap * 0.2),
              child: Text(
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
              // ширина колонки уже зафиксирована через IntrinsicWidth,
              // поэтому просто прижимаем Row к правому краю
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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

    return Align(
      // если моё то справа, чужое — слева
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: _showAvatar
          // в группе у чужих сообщений добавляем аватарку слева от бабла
          ? Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                UserAvatar(
                  avatarUrl: message.sender.avatarUrl,
                  fallbackLetter: message.sender.username,
                  size: avatarSize,
                  fontSize: spacing.captionSize * 1.7,
                ),
                SizedBox(width: gap * 0.5),
                Flexible(child: bubble),
              ],
            )
          : bubble,
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