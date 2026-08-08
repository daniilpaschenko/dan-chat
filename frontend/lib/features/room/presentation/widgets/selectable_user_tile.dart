import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/user_avatar.dart';
import '../../../user/domain/entities/user_entity.dart';

class SelectableUserTile extends StatelessWidget {
  final PartialUserEntity user;
  final bool isSelected;
  final double gap;
  final VoidCallback onTap;

  const SelectableUserTile({
    super.key,
    required this.user,
    required this.isSelected,
    required this.gap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final double avatarSize = gap * 2;
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
        user.username,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: spacing.captionSize * 1.8, color: AppColors.textPrimary, fontWeight: FontWeight.w600),
      ),
      trailing: Icon(
        isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
      ),
    );
  }
}