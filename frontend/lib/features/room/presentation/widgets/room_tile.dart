import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/user_avatar.dart';

// один элемент списка чатов
class RoomTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isTyping;
  final String? avatarUrl;
  final bool isOnline;
  final int unreadCount;
  final double gap;
  final VoidCallback onTap;
  final DateTime? lastMessageAt;
  final bool isLastMessageMine;
  final bool isLastMessageRead;

  const RoomTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isTyping = false,
    required this.avatarUrl,
    this.isOnline = false,
    required this.unreadCount,
    required this.gap,
    required this.onTap,
    this.lastMessageAt,
    this.isLastMessageMine = false,
    this.isLastMessageRead = false,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final double avatarSize = gap * 2;
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: gap, vertical: gap * 0.15),
      leading: Stack( 
        clipBehavior: Clip.none, // чтобы зелёная точка онлайн выходила за границы аватара
        children: [
          UserAvatar(
            avatarUrl: avatarUrl,
            fallbackLetter: title,
            size: avatarSize,
            fontSize: spacing.captionSize * 1.7,
          ),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: avatarSize * 0.3,
                height: avatarSize * 0.3,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.background, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        // ellipsis - если длинное название сделает троеточие
        title, maxLines: 1, overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: spacing.captionSize * 1.8, color: AppColors.textPrimary, fontWeight: FontWeight.w600),
      ),
      subtitle: subtitle != null
        ? Text(
            subtitle!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: spacing.captionSize * 1.25,
              color: isTyping ? AppColors.primary : AppColors.textSecondary,
            ),
          )
        : null,
      trailing: (lastMessageAt != null || unreadCount > 0 || isLastMessageMine)
        ? SizedBox(
            height: avatarSize, // например, высота как у аватара
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
                children: [
                  if (lastMessageAt != null || isLastMessageMine)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isLastMessageMine) ...[
                          Icon(
                            isLastMessageRead ? Icons.done_all : Icons.done,
                            size: spacing.captionSize * 1.2,
                            color: isLastMessageRead
                                ? AppColors.primary
                                : AppColors.textSecondary,
                          ),
                          SizedBox(width: gap * 0.15),
                        ],
                        if (lastMessageAt != null)
                          Text(
                            _formatTime(lastMessageAt!),
                            style: TextStyle(
                              fontSize: spacing.captionSize * 1.1,
                              color: AppColors.textSecondary,
                            ),
                          ),
                      ],
                    ),
                  if (unreadCount > 0) ...[
                    SizedBox(height: gap * 0.2),
                    CircleAvatar(
                      radius: gap * 0.5,
                      backgroundColor: AppColors.textSecondary,
                      child: Text(
                        unreadCount > 99 ? '99+' : '$unreadCount',
                        style: TextStyle(
                          fontSize: spacing.captionSize * 1.2,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ): null,
    );
  }

  String _formatTime(DateTime dateTime) {
    final local = dateTime.toLocal();
    final now = DateTime.now();

    final isToday =
        local.year == now.year &&
        local.month == now.month &&
        local.day == now.day;

    if (isToday) {
      final hours = local.hour.toString().padLeft(2, '0');
      final minutes = local.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }

    final yesterday = now.subtract(const Duration(days: 1));

    final isYesterday =
        local.year == yesterday.year &&
        local.month == yesterday.month &&
        local.day == yesterday.day;

    if (isYesterday) {
      return 'вчера';
    }

    final localDate = DateTime(local.year, local.month, local.day);
    final today = DateTime(now.year, now.month, now.day);
    final daysDiff = today.difference(localDate).inDays;

    // Последние 7 дней
    if (daysDiff < 7) {
      const weekdays = [
        'пн', 'вт', 'ср', 'чт', 'пт', 'сб', 'вс',
      ];

      return weekdays[local.weekday - 1];
    }

    // В этом году
    if (local.year == now.year) {
      const months = [
        'янв.',
        'февр.',
        'мар.',
        'апр.',
        'мая',
        'июн.',
        'июл.',
        'авг.',
        'сент.',
        'окт.',
        'нояб.',
        'дек.',
      ];

      return '${local.day} ${months[local.month - 1]}';
    }

    // прошлый год и раньше
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');

    return '$day.$month.${local.year}';
  }
}