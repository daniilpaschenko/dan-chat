import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/user_avatar.dart';
import '../../../room/domain/entities/room_display_info.dart';
import '../../../room/data/models/room.dart';

// кастомный AppBar: своя стрелка назад, аватарка, название чата и подзаголовок
class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final RoomListItem? room;
  final String? currentUserId;

  const ChatAppBar({super.key, required this.room, required this.currentUserId});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final double avatarSize = spacing.medium * 1.3;

    final info = RoomDisplayInfo.from(room, currentUserId, includeSubtitle: true);

    return AppBar(
      // выключаем стандартную кнопку назад — рисуем всё сами
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          // стрелка назад -> в chatList
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          SizedBox(width: spacing.small * 0.5),
          // аватарка чата
          UserAvatar(
            avatarUrl: info.avatarUrl,
            fallbackLetter: info.title,
            size: avatarSize,
            fontSize: spacing.captionSize * 1.7,
          ),
          SizedBox(width: spacing.small),
          // название чата и статус/кол-во участников
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: spacing.captionSize * 1.7, fontWeight: FontWeight.w600),
                ),
                if (info.subtitle != null)
                  Text(
                    info.subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: spacing.captionSize * 1.2, color: AppColors.textSecondary),
                  ),
              ],
            ),
          ),
          // три точки — пока ничего не делают
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}