import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/widgets/user_avatar.dart';
import '../../../../core/widgets/confirm_dialog.dart';
import '../../domain/entities/room_entity.dart';

class ParticipantTile extends StatelessWidget {
  final ParticipantEntity participant;
  final bool canManage; // может ли текущий юзер кикать (owner/admin)
  final bool isMe;
  final ValueChanged<String> onRemove; // userId

  const ParticipantTile({
    super.key,
    required this.participant,
    required this.canManage,
    required this.isMe,
    required this.onRemove,
  });

  String get _roleLabel {
    switch (participant.role) {
      case ParticipantRole.owner:
        return 'Владелец';
      case ParticipantRole.admin:
        return 'Админ';
      case ParticipantRole.member:
        return 'Участник';
    }
  }

  Future<void> _onLongPress(BuildContext context) async {
    // кикнуть можно только чужого участника + если ты admin/owner
    if (!canManage || isMe) return;

    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('В разработке'),
              onTap: () => Navigator.pop(context, 'wip'),
            ),
            ListTile(
              title: Text('Удалить из группы', style: TextStyle(color: AppColors.error)),
              onTap: () => Navigator.pop(context, 'remove'),
            ),
          ],
        ),
      ),
    );

    if (action != 'remove' || !context.mounted) return;

    // нельзя кикнуть владельца
    if (participant.role == ParticipantRole.owner) return;

    final confirmed = await showConfirmDialog(
      context,
      title: 'Удалить участника?',
      message: '${participant.user.username} будет удалён(а) из группы',
      confirmText: 'Удалить',
    );
    if (confirmed) onRemove(participant.user.id);
  }

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    return ListTile(
      onTap: () => context.push(
        RoutePaths.userProfile.replaceFirst(':userId', participant.user.id),
      ),
      onLongPress: () => _onLongPress(context),
      contentPadding: EdgeInsets.symmetric(horizontal: spacing.pagePadding, vertical: spacing.small * 0.15),
      leading: UserAvatar(
        avatarUrl: participant.user.avatarUrl,
        fallbackLetter: participant.user.username,
        size: spacing.medium * 1.3,
        fontSize: spacing.captionSize * 1.7,
      ),
      title: Text(
        participant.user.username,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: spacing.captionSize * 1.6, fontWeight: FontWeight.w600),
      ),
      trailing: Text(
        _roleLabel,
        style: TextStyle(fontSize: spacing.captionSize * 1.2, color: AppColors.textSecondary),
      ),
    );
  }
}