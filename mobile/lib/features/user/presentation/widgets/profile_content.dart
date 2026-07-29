import 'package:flutter/material.dart';
import '../../../../core/theme/app_spacing.dart';
import 'hero_photo.dart';
import 'action_button.dart';
import 'info_tile.dart';

class ProfileContent extends StatelessWidget {
  final bool isOwnProfile;
  final String? avatarUrl;
  final String username;
  final String? email;
  final bool isUploadingAvatar;
  final VoidCallback onPickPhoto;

  const ProfileContent({
    super.key,
    required this.isOwnProfile,
    required this.avatarUrl,
    required this.username,
    required this.email,
    required this.isUploadingAvatar,
    required this.onPickPhoto,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final screenH = MediaQuery.of(context).size.height;
    final photoHeight = screenH * 0.475; // между 1/2 и 2/3 экрана

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        HeroPhoto(
          avatarUrl: avatarUrl,
          fallbackLetter: username,
          height: photoHeight,
          isUploading: isUploadingAvatar,
          showBackButton: !isOwnProfile,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            spacing.pagePadding,
            spacing.medium / 2,
            spacing.pagePadding,
            0,
          ),
          child: isOwnProfile
              ? Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        icon: Icons.photo_camera_outlined,
                        label: 'Выбрать фото',
                        onTap: onPickPhoto,
                      ),
                    ),
                    SizedBox(width: spacing.buttonGap),
                    Expanded(
                      child: ActionButton(
                        icon: Icons.edit_outlined,
                        label: 'Изменить',
                        // TODO: редактирование профиля пока не реализовано на бэкэнде
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: spacing.buttonGap),
                    Expanded(
                      child: ActionButton(
                        icon: Icons.settings_outlined,
                        label: 'Настройки',
                        // TODO: подключить роут настроек
                        onTap: () {},
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        icon: Icons.chat_bubble_outline,
                        label: 'Чат',
                        // TODO: создать/открыть комнату с этим юзером
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: spacing.buttonGap),
                    Expanded(
                      child: ActionButton(
                        icon: Icons.settings_outlined,
                        label: 'Настройки',
                        onTap: () {},
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
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (email != null) ...[
                InfoTile(value: email!, label: 'Почта'),
                SizedBox(height: spacing.buttonGap),
              ],
              InfoTile(value: username, label: 'Имя пользователя'),
            ],
          )
        ),
      ],
    );
  }
}