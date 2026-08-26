import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/user_avatar.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/network/connectivity_service.dart';
import '../../domain/entities/user_entity.dart';

// один элемент списка результатов поиска пользователей
class UserTile extends StatelessWidget {
  final PartialUserEntity user;
  final double gap;
  final VoidCallback onTap;

  const UserTile({
    super.key,
    required this.user,
    required this.gap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final double avatarSize = gap * 2;
    final connectivityService = getIt<ConnectivityService>();

    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: gap, vertical: gap * 0.15),
      leading: UserAvatar(
        avatarUrl: user.avatarUrl,
        fallbackLetter: user.username,
        size: avatarSize,
        fontSize: spacing.captionSize * 1.7,
      ),
      title: Text(
        user.username, maxLines: 1, overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: spacing.captionSize * 1.8, color: AppColors.textPrimary, fontWeight: FontWeight.w600),
      ),
      subtitle: StreamBuilder<bool>(
        stream: connectivityService.onStatusChanged,
        initialData: connectivityService.isOnline,
        builder: (context, snapshot) {
          final isOnline = snapshot.data ?? true;

          if (!isOnline) {
            return Text(
              'Соединение...',
              style: TextStyle(color: AppColors.textSecondary, fontSize: gap * 0.6),
            );
          }

          if (user.status == null) return const SizedBox.shrink();

          return Text(
            user.status == UserStatus.online ? 'в сети' : 'не в сети',
            style: TextStyle(
              color: user.status == UserStatus.online ? AppColors.primary : AppColors.textSecondary,
              fontSize: gap * 0.6,
            ),
          );
        },
      ),
    );
  }
}