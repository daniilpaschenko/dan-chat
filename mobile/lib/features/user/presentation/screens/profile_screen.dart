import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/error_view.dart';
import '../blocs/profile/profile_bloc.dart';
import '../blocs/profile/profile_event.dart';
import '../blocs/profile/profile_state.dart';
import '../widgets/profile_content.dart';

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

class _ProfileView extends StatelessWidget {
  final bool isOwnProfile;

  const _ProfileView({required this.isOwnProfile});

  Future<void> _pickAndUploadAvatar(BuildContext context) async {
    final picker = ImagePicker();
    // выбор из галлери, качество изображения 90%
    final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 90);
    // если юзер отменил выбор — выходим
    if (picked == null) return;
    // если виджет удалён с экрана — не делаем ничего
    if (!context.mounted) return;
    // отправляем событие загрузки аватара с файлом
    context.read<ProfileBloc>().add(ProfileEvent.avatarUploadRequested(File(picked.path)));
  }

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
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
              loaded: (isOwn, ownUser, otherUser, isUploadingAvatar) => ProfileContent(
                isOwnProfile: isOwnProfile,
                avatarUrl: isOwn ? ownUser?.avatarUrl : otherUser?.avatarUrl,
                username: (isOwn ? ownUser?.username : otherUser?.username) ?? '',
                email: ownUser?.email, // есть только у своего профиля
                isUploadingAvatar: isUploadingAvatar,
                onPickPhoto: () => _pickAndUploadAvatar(context),
              ),
            );
          },
        ),
      ),
    );
  }
}