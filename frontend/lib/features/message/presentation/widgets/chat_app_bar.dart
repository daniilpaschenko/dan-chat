import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/widgets/user_avatar.dart';
import '../../../../core/widgets/confirm_dialog.dart';
import '../../../room/domain/entities/room_display_info.dart';
import '../../../room/domain/entities/room_entity.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../blocs/chat_room_bloc.dart';
import '../blocs/chat_room_state.dart';
import '../blocs/chat_room_event.dart';

// кастомный AppBar: своя стрелка назад, аватарка, название чата и подзаголовок
class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final RoomListItemEntity? room;
  final String? currentUserId;

  const ChatAppBar({super.key, required this.room, required this.currentUserId});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

    // собеседник в личном чате — участник, чей user.id != currentUserId
    PartialUserEntity? get _otherUser {
      if (room == null || room!.type != RoomType.direct) return null;
      try {
        return room!.participants
            .firstWhere((p) => p.user.id != currentUserId)
            .user;
      } catch (_) {
        return null; // не нашли (например, чат сам с собой) или групповой чат
      }
    }

  // приоритет: печатает -> live-presence -> статика из room
  String? _liveSubtitle(ChatRoomState state, PartialUserEntity? otherUser, String? staticSubtitle) {
    if (room != null && room!.type == RoomType.group) {
      if (state.typingUsers.isNotEmpty) {
        final names = state.typingUsers.values.toList();
        return names.length == 1 ? '${names.first} печатает...' : 'печатают...';
      }
      return staticSubtitle;
    }

    if (otherUser == null) return staticSubtitle;

    if (state.typingUsers.containsKey(otherUser.id)) {
      return 'печатает...';
    }

    final liveStatus = state.participantsStatus[otherUser.id];
    if (liveStatus == null) return staticSubtitle; // presence ещё не приходил

    final liveLastSeen = state.participantsLastSeen[otherUser.id] ?? otherUser.lastSeen;
    return RoomDisplayInfo.presenceText(liveStatus, liveLastSeen);
  }


  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final double avatarSize = spacing.medium * 1.3;

    final info = RoomDisplayInfo.from(room, currentUserId, includeSubtitle: true);
    final otherUser = _otherUser;

    final chatState = context.watch<ChatRoomBloc>().state;
    final subtitle = _liveSubtitle(chatState, otherUser, info.subtitle);
    final isTyping = subtitle == 'печатает...' || (subtitle?.contains('печатают') ?? false);

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

          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (room == null) return;
                if (room!.type == RoomType.group) {
                  context.push(RoutePaths.groupProfilePath(room!.id));
                } else if (otherUser != null) {
                  context.push(RoutePaths.userProfile.replaceFirst(':userId', otherUser.id));
                }
              },
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
                        if (subtitle != null)
                          Text(
                            subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: spacing.captionSize * 1.2,
                              color: isTyping ? AppColors.primary : AppColors.textSecondary,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // три точки, описанные ниже
          _buildMenu(context),
        ],
      ),
    );
  }
  
  Widget _buildMenu(BuildContext context) {
    final isGroup = room?.type == RoomType.group;
    final isOwner = room != null &&
        room!.participants.any(
          (p) => p.user.id == currentUserId && p.role == ParticipantRole.owner,
        );
    // в группе удалить может только owner, в личном чате — любой участник
    final canDelete = room != null && (!isGroup || isOwner);

    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) async {
        switch (value) {
          case 'delete':
            final confirmed = await showConfirmDialog(
              context,
              title: 'Удалить чат?',
              message: 'Это действие необратимо, история переписки будет удалена',
            );
            if (confirmed && context.mounted) {
              context.read<ChatRoomBloc>().add(const ChatRoomEvent.deleteRoomRequested());
            }
            break;
          case 'leave':
            final confirmed = await showConfirmDialog(
              context,
              title: 'Покинуть чат?',
              message: 'Вы сможете вернуться только если вас пригласят снова',
              confirmText: 'Покинуть',
            );
            if (confirmed && context.mounted) {
              context.read<ChatRoomBloc>().add(const ChatRoomEvent.leaveRoomRequested());
            }
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'wip', child: Text('В разработке')),
        if (canDelete)
          const PopupMenuItem(value: 'delete', child: Text('Удалить чат')),
        // если групповой чат, то добавить пункт "Покинуть чат"
        if (isGroup)
          const PopupMenuItem(value: 'leave', child: Text('Покинуть чат')),
      ],
    );
  }
}