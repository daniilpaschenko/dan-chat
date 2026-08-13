import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/message_entity.dart';

class SystemMessageBubble extends StatelessWidget {
  final MessageEntity message;
  final String? currentUserId;
  final AppSpacing spacing;

  const SystemMessageBubble({
    super.key,
    required this.message,
    required this.currentUserId,
    required this.spacing,
  });

  String _name(dynamic user) => user?.username ?? '';

  String get _text {
    final actor = _name(message.sender);
    final target = _name(message.systemTarget);

    switch (message.systemAction) {
      case SystemMessageAction.participantAdded:
        return '$actor добавил(а) $target';
      case SystemMessageAction.participantRemoved:
        return '$actor удалил(а) $target';
      case SystemMessageAction.participantLeft:
        return '$actor вышел(а) из группы';
      case SystemMessageAction.participantPromoted:
        return '$actor назначил(а) $target администратором';
      case SystemMessageAction.participantDemoted:
        return '$actor понизил(а) $target до участника';
      case null:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: spacing.small * 0.4),
        padding: EdgeInsets.symmetric(horizontal: spacing.small, vertical: spacing.small * 0.4),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(spacing.bubbleRadius),
        ),
        child: Text(
          _text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: spacing.captionSize, color: AppColors.textSecondary),
        ),
      ),
    );
  }
}