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
  final bool isOwner; // может ли текущий юзер менять роли (только owner)
  final bool isMe;
  final ValueChanged<String> onRemove; // userId
  final void Function(String userId, ParticipantRole newRole) onChangeRole;

  const ParticipantTile({
    super.key,
    required this.participant,
    required this.canManage,
    required this.isOwner,
    required this.isMe,
    required this.onRemove,
    required this.onChangeRole,
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
    // нельзя ничего сделать с собой
    if (isMe) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.surfaceVariant,
          content: Text(
            'Это Вы',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textPrimary),
          )
        ),
      );
      return;
    }

    // меню не открывается если нет прав
    if (!canManage && !isOwner) return;

    // нельзя ничего сделать с владельцем — ни кикнуть, ни поменять роль
    if (participant.role == ParticipantRole.owner) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.surfaceVariant,
          content: Text(
            'Вы не можете повлиять на владельца группы',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textPrimary),
          )
        ),
      );
      return;
    }

    // сменой роли распоряжается только owner
    final canChangeRole = isOwner;
    final promote = participant.role == ParticipantRole.member;

    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (canChangeRole)
              ListTile(
                title: Text(promote ? 'Повысить до админа' : 'Понизить до участника'),
                onTap: () => Navigator.pop(context, 'role'),
              ),
            if (canManage)
              ListTile(
                title: Text('Удалить из группы', style: TextStyle(color: AppColors.error)),
                onTap: () => Navigator.pop(context, 'remove'),
              ),
          ],
        ),
      ),
    );

    if (!context.mounted) return;

    if (action == 'role') {
      final newRole = promote ? ParticipantRole.admin : ParticipantRole.member;
      onChangeRole(participant.user.id, newRole);
      return;
    }

    if (action != 'remove') return;

    final confirmed = await showConfirmDialog(
      context,
      title: 'Удалить пользователя?',
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