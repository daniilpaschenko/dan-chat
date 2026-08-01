import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/widgets/user_avatar.dart';
import '../../../room/domain/entities/room_display_info.dart';
import '../../../room/domain/entities/room_entity.dart';
import '../../../user/data/models/user_model.dart'; // TODO: domain/entities/user_entity.dart


// кастомный AppBar: своя стрелка назад, аватарка, название чата и подзаголовок
class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final RoomListItemEntity? room;
  final String? currentUserId;

  const ChatAppBar({super.key, required this.room, required this.currentUserId});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

    // собеседник в личном чате — участник, чей user.id != currentUserId
    PartialUser? get _otherUser {
      if (room == null || room!.type != RoomType.direct) return null;
      try {
        return room!.participants
            .firstWhere((p) => p.user.id != currentUserId)
            .user;
      } catch (_) {
        return null; // не нашли (например, чат сам с собой) или групповой чат
      }
    }

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final double avatarSize = spacing.medium * 1.3;

    final info = RoomDisplayInfo.from(room, currentUserId, includeSubtitle: true);
    final otherUser = _otherUser;

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
          // РАБОТАЕТ ТОЛЬКО ДЛЯ DIRECT-ЧАТОВ
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: otherUser == null
                  ? null
                  : () => context.push(
                        RoutePaths.userProfile.replaceFirst(':userId', otherUser.id),
                      ),
              child: Row(
                children: [
                  UserAvatar(
                    avatarUrl: info.avatarUrl,
                    fallbackLetter: info.title,
                    size: avatarSize,
                    fontSize: spacing.captionSize * 1.7,
                  ),
                  SizedBox(width: spacing.small),
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
                ],
              ),
            ),
          ),

          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}