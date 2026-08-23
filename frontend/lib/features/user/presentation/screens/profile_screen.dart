import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/navigation/auth_state_notifier.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/error_view.dart';
import '../blocs/profile/profile_bloc.dart';
import '../blocs/profile/profile_event.dart';
import '../blocs/profile/profile_state.dart';
import '../widgets/profile_content.dart';
import '../../../room/domain/entities/room_entity.dart';
import '../../../room/domain/entities/room_display_info.dart';

class ProfileScreen extends StatelessWidget {
  // null -> свой профиль
  final String? userId;

  const ProfileScreen({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    final isOwnProfile = userId == null;

    return BlocProvider(
      create: (_) => getIt<ProfileBloc>(param1: userId)
        ..add(const ProfileEvent.started()),
      child: _ProfileView(isOwnProfile: isOwnProfile),
    );
  }
}

class _ProfileView extends StatefulWidget {
  final bool isOwnProfile;

  const _ProfileView({required this.isOwnProfile});

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  Timer? _tickTimer;

  @override
  void initState() {
    super.initState();
    // раз в 30 сек триггерим ребилд, чтобы текст "X мин назад" не "застывал"
    _tickTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tickTimer?.cancel();
    super.dispose();
  }

  Future<void> _pickAndUploadAvatar(BuildContext context) async {
    final picker = ImagePicker();
    // выбор из галлери, качество изображения 90%
    final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 90);
    // если юзер отменил выбор — выходим
    if (picked == null) return;
    // если виджет удалён с экрана — не делаем ничего
    if (!context.mounted) return;
    // отправляем событие загрузки аватара с файлом
    context.read<ProfileBloc>().add(ProfileEvent.avatarUploadRequested(picked));
  }

  Future<void> _showChangeUsernameDialog(BuildContext context, String currentUsername) async {
    final controller = TextEditingController(text: currentUsername);
    final bloc = context.read<ProfileBloc>();

    final newName = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Изменить имя пользователя'),
          content: TextField(
            controller: controller,
            autofocus: true,
            maxLength: 16,
            decoration: const InputDecoration(hintText: 'Новое имя пользователя'),
            onSubmitted: (value) => Navigator.of(dialogContext).pop(value),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(controller.text),
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );

    controller.dispose();

    final trimmed = newName?.trim();
    // если юзер отменил или ничего не поменял — не шлём событие
    if (trimmed == null || trimmed.isEmpty || trimmed == currentUsername) return;

    bloc.add(ProfileEvent.changeUsernameRequested(trimmed));
  }

    @override
    Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) =>
              current is ProfileLoaded &&
              (current.navigateToRoom != null ||
                  current.chatError != null ||
                  current.usernameError != null),
          listener: (context, state) {
            if (state is! ProfileLoaded) return;

            if (state.chatError != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.chatError!)),
              );
              context.read<ProfileBloc>().add(const ProfileEvent.chatErrorHandled());
            }

            if (state.usernameError != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.usernameError!)),
              );
              context.read<ProfileBloc>().add(const ProfileEvent.usernameErrorHandled());
            }

            if (state.navigateToRoom != null) {
              final room = state.navigateToRoom!;
              context.read<ProfileBloc>().add(const ProfileEvent.chatNavigationHandled());

              final currentUserId = getIt<AuthStateNotifier>().currentUserId;
              final roomListItem = RoomListItemEntity(
                id: room.id,
                type: room.type,
                name: room.name,
                avatarUrl: room.avatarUrl,
                participants: room.participants,
                createdBy: room.createdBy,
                lastMessage: room.lastMessage,
                unreadCount: room.unreadCount[currentUserId] ?? 0,
                createdAt: room.createdAt,
                updatedAt: room.updatedAt,
              );

              context.go(RoutePaths.chatRoomPath(room.id), extra: roomListItem);
            }
          },
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: (message) => SafeArea(
                child: Center(
                  child: ErrorView(
                    message: message,
                    gap: spacing.errorGap,
                    onRetry: () => context.read<ProfileBloc>().add(const ProfileEvent.started()),
                  ),
                ),
              ),
              loaded: (isOwn, ownUser, otherUser, isUploadingAvatar, isCreatingChat, isChangingUsername, navigateToRoom, chatError, usernameError) {
                final currentUsername = (isOwn ? ownUser?.username : otherUser?.username) ?? '';
                return ProfileContent(
                  isOwnProfile: widget.isOwnProfile,
                  avatarUrl: isOwn ? ownUser?.avatarUrl : otherUser?.avatarUrl,
                  username: currentUsername,
                  email: ownUser?.email, // есть только у своего профиля
                  isUploadingAvatar: isUploadingAvatar,
                  isCreatingChat: isCreatingChat,
                  isChangingUsername: isChangingUsername,
                  // статус нужен только для чужого профиля
                  statusText: !isOwn && otherUser != null
                      ? RoomDisplayInfo.presenceText(otherUser.status, otherUser.lastSeen)
                      : null,
                  onPickPhoto: () => _pickAndUploadAvatar(context),
                  onChatTap: () => context.read<ProfileBloc>().add(const ProfileEvent.chatRequested()),
                  onChangeUsername: () => _showChangeUsernameDialog(context, currentUsername),
                );
              },
            );
          },
        ),
      ),
    );
  }
}