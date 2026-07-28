import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/user_avatar.dart';

// один элемент списка чатов
class RoomTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? avatarUrl;
  final int unreadCount;
  final double gap;
  final VoidCallback onTap;

  const RoomTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.avatarUrl,
    required this.unreadCount,
    required this.gap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final double avatarSize = gap * 2;
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: gap, vertical: gap * 0.15),
      leading: UserAvatar(
        avatarUrl: avatarUrl,
        fallbackLetter: title,
        size: avatarSize,
        fontSize: spacing.captionSize * 1.7,
      ),
      // ellipsis - если длинное название сделает троеточие
      title: Text(
        title, maxLines: 1, overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: spacing.captionSize * 1.8, color: AppColors.textPrimary, fontWeight: FontWeight.w600),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: spacing.captionSize * 1.25, color: AppColors.textSecondary),
            )
          : null,
      // счётчик непрочитанных сообщений
      trailing: unreadCount > 0
          ? CircleAvatar(
              radius: gap * 0.6,
              backgroundColor: AppColors.textSecondary,
              child: Text(
                unreadCount > 99 ? '99+' : '$unreadCount',
                style: TextStyle(fontSize: spacing.captionSize * 1.3, color: AppColors.textPrimary),
              ),
            )
          : null,
    );
  }
}