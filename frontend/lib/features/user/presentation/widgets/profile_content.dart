import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/navigation/route_paths.dart';
import 'hero_photo.dart';
import 'action_button.dart';
import 'info_tile.dart';

class ProfileContent extends StatelessWidget {
  final bool isOwnProfile;
  final String? avatarUrl;
  final String username;
  final String? email;
  final bool isUploadingAvatar;
  final bool isCreatingChat;
  final bool isChangingUsername;
  final String? statusText;
  final VoidCallback onPickPhoto;
  final VoidCallback onChatTap;
  final VoidCallback onChangeUsername;

  const ProfileContent({
    super.key,
    required this.isOwnProfile,
    required this.avatarUrl,
    required this.username,
    required this.email,
    required this.isUploadingAvatar,
    required this.isCreatingChat,
    required this.isChangingUsername,
    this.statusText,
    required this.onPickPhoto,
    required this.onChatTap,
    required this.onChangeUsername,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final screenH = MediaQuery.of(context).size.height;
    final isDesktop = spacing.isDesktop;
    // проверяем, нужен ли AppBar
    final hasAppBar = !isOwnProfile;
    
    // если AppBar есть, уменьшаем высоту фото
    final appBarHeight = hasAppBar ? (MediaQuery.of(context).padding.top + kToolbarHeight) : 0.0;
    final photoHeight = (screenH * 0.475) - appBarHeight;

    Widget listContent = ListView(
      padding: EdgeInsets.zero,
      children: [
        HeroPhoto(
          avatarUrl: avatarUrl,
          fallbackLetter: username,
          height: photoHeight > 0 ? photoHeight : screenH * 0.4,
          isUploading: isUploadingAvatar,
          statusText: statusText,
          isDesktop: isDesktop,
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
                        label: 'Изменить имя',
                        onTap: isChangingUsername ? () {} : onChangeUsername,
                      ),
                    ),
                    SizedBox(width: spacing.buttonGap),
                    Expanded(
                      child: ActionButton(
                        icon: Icons.settings_outlined,
                        label: 'Настройки',
                        onTap: () => context.push(RoutePaths.settings),
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
                        onTap: isCreatingChat ? () {} : onChatTap,
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
            isDesktop ? spacing.pagePadding : 0,
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
          ),
        ),
      ],
    );

    // на десктопе — центрируем колонку разумной ширины, чтобы всё не размазывалось
    if (isDesktop) {
      listContent = Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: listContent,
        ),
      );
    }

    return Scaffold(
      appBar: hasAppBar
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              ),
            )
          : null,
      body: listContent,
    );
  }
}