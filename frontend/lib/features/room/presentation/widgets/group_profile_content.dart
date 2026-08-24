import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/room_entity.dart';
import '../../domain/entities/room_display_info.dart';
import '../widgets/participant_tile.dart';
import '../../../user/presentation/widgets/hero_photo.dart';
import '../../../user/presentation/widgets/action_button.dart';

class GroupProfileContent extends StatelessWidget {
  final RoomEntity room;
  final String? currentUserId;
  final bool isRemoving;
  final bool isUploadingAvatar;
  final bool isChangingName;
  final ValueChanged<String> onRemoveParticipant;
  final VoidCallback onAddParticipants;
  final VoidCallback onPickPhoto;
  final VoidCallback onChangeName;
  final void Function(String userId, ParticipantRole newRole)
  onChangeParticipantRole;

  const GroupProfileContent({
    super.key,
    required this.room,
    required this.currentUserId,
    required this.isRemoving,
    required this.isUploadingAvatar,
    required this.isChangingName,
    required this.onRemoveParticipant,
    required this.onAddParticipants,
    required this.onPickPhoto,
    required this.onChangeName,
    required this.onChangeParticipantRole,
  });

  ParticipantEntity? get _me {
    try {
      return room.participants.firstWhere((p) => p.user.id == currentUserId);
    } catch (_) {
      return null;
    }
  }

  bool get _canManage =>
      _me != null &&
      (_me!.role == ParticipantRole.owner ||
          _me!.role == ParticipantRole.admin);

  bool get _isOwner => _me != null && _me!.role == ParticipantRole.owner;

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final isDesktop = spacing.isDesktop;
    final screenH = MediaQuery.of(context).size.height;
    final appBarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
    final photoHeight = (screenH * 0.5) - appBarHeight;

    // переиспользование RoomDisplayInfo: даёт готовые title/avatarUrl/? участников
    final listItem = room.toListItem(currentUserId);
    final info = RoomDisplayInfo.from(
      listItem,
      currentUserId,
      includeSubtitle: true,
    );

    void showSnackBar(String text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.surfaceVariant,
          duration: const Duration(seconds: 1),
          content: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textPrimary),
          ),
        ),
      );
    }

    Widget listContent = ListView(
      padding: EdgeInsets.zero,
      children: [
        HeroPhoto(
          avatarUrl: info.avatarUrl,
          fallbackLetter: info.title,
          height: photoHeight > 0 ? photoHeight : screenH * 0.35,
          isUploading: isUploadingAvatar,
          statusText: info.subtitle,
          isDesktop: isDesktop,
        ),
        Center(
          child: isChangingName
              ? SizedBox(
                  height: spacing.captionSize * 1.8,
                  width: spacing.captionSize * 1.8,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(
                  info.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: spacing.captionSize * 1.8,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
          ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            spacing.pagePadding,
            spacing.medium / 2,
            spacing.pagePadding,
            0,
          ),
          child: Row(
            children: [
              Expanded(
                child: ActionButton(
                  icon: Icons.person_add_outlined,
                  label: 'Добавить',
                  onTap: _canManage
                      ? onAddParticipants
                      : () => showSnackBar(
                          'Добавлять участников может только владелец или админ',
                        ),
                ),
              ),
              SizedBox(width: spacing.buttonGap),
              Expanded(
                child: ActionButton(
                  icon: Icons.photo_camera_outlined,
                  label: 'Выбрать фото',
                  onTap: _canManage
                      ? onPickPhoto
                      : () => showSnackBar(
                          'Изменять аватарку группы может только владелец или админ',
                        ),
                ),
              ),
              SizedBox(width: spacing.buttonGap),
              Expanded(
                child: ActionButton(
                  icon: Icons.edit_outlined,
                  label: 'Изменить название',
                  onTap: !_canManage
                      ? () => showSnackBar(
                          'Изменять название группы может только владелец или админ',
                        )
                      : (isChangingName ? () {} : onChangeName),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            spacing.pagePadding,
            spacing.pagePadding,
            spacing.pagePadding,
            spacing.small,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Участники',
              style: TextStyle(
                fontSize: spacing.captionSize * 1.4,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
        ...room.participants.expand(
          (p) => [
            ParticipantTile(
              participant: p,
              canManage: _canManage,
              isOwner: _isOwner,
              isMe: p.user.id == currentUserId,
              onRemove: isRemoving ? (_) {} : onRemoveParticipant,
              onChangeRole: onChangeParticipantRole,
            ),
            if (isDesktop) SizedBox(height: spacing.small * 0.5),
          ],
        ),
        SizedBox(height: spacing.pagePadding),
      ],
    );

    if (isDesktop) {
      listContent = Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: listContent,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: listContent,
    );
  }
}