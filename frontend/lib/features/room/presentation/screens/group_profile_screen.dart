import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/navigation/auth_state_notifier.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/error_view.dart';
import '../../domain/entities/room_entity.dart';
import '../blocs/group/group_profile_bloc.dart';
import '../blocs/group/group_profile_event.dart';
import '../blocs/group/group_profile_state.dart';
import '../widgets/group_profile_content.dart';
import '../widgets/change_group_name_dialog.dart';

class GroupProfileScreen extends StatelessWidget {
  final String roomId;

  const GroupProfileScreen({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GroupProfileBloc>(param1: roomId)..add(const GroupProfileEvent.started()),
      child: _GroupProfileView(),
    );
  }
}

class _GroupProfileView extends StatefulWidget {
  const _GroupProfileView();

  @override
  State<_GroupProfileView> createState() => _GroupProfileViewState();
}

class _GroupProfileViewState extends State<_GroupProfileView> {

  Future<void> _pickAndUploadAvatar(BuildContext context) async {
    final picker = ImagePicker();
    // выбор из галлери, качество изображения 90%
    final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 90);
    // если юзер отменил выбор — выходим
    if (picked == null) return;
    // если виджет удалён с экрана — не делаем ничего
    if (!context.mounted) return;
    // отправляем событие загрузки аватара с файлом
    context.read<GroupProfileBloc>().add(GroupProfileEvent.avatarUploadRequested(picked));
  }

  Future<void> _showChangeNameDialog(BuildContext context, String? currentName) async {
    final bloc = context.read<GroupProfileBloc>();

    final newName = await showDialog<String>(
      context: context,
      builder: (dialogContext) => ChangeGroupNameDialog(currentName: currentName),
    );

    final trimmed = newName?.trim();
    if (trimmed == null || trimmed.isEmpty || trimmed == currentName) return;

    bloc.add(GroupProfileEvent.changeNameRequested(roomId: bloc.roomId, name: trimmed));
  }

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final currentUserId = getIt<AuthStateNotifier>().currentUserId;

    return BlocConsumer<GroupProfileBloc, GroupProfileState>(
      listenWhen: (previous, current) =>
          current is GroupProfileLoaded
          && (current.errorMessage != null || current.nameError != null || current.removedRemotely),
      listener: (context, state) {
        if (state is! GroupProfileLoaded) return;
        // нас выкинули из группы (или её удалил owner) — уход с экрана
        if (state.removedRemotely) {
          if (context.canPop()) context.pop();
          return;
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
        if (state.nameError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.nameError!)),
          );
        }
      },
      builder: (context, state) {
        return state.when(
          initial: () => const Scaffold(body: SizedBox.shrink()),
          loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
          failure: (message) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: ErrorView(
                message: message,
                gap: spacing.errorGap,
                onRetry: () => context.read<GroupProfileBloc>().add(const GroupProfileEvent.started()),
              ),
            ),
          ),
          loaded: (room, isRemoving, isChangingRole, isUploadingAvatar, isChangingName, errorMessage, nameError, removedRemotely) => GroupProfileContent(
            room: room,
            currentUserId: currentUserId,
            isRemoving: isRemoving,
            isUploadingAvatar: isUploadingAvatar,
            isChangingName: isChangingName,
            onRemoveParticipant: (userId) =>
                context.read<GroupProfileBloc>().add(GroupProfileEvent.participantRemoveRequested(userId)),
            onChangeParticipantRole: (userId, newRole) => context
                .read<GroupProfileBloc>()
                .add(GroupProfileEvent.participantRoleChangeRequested(userId, newRole)),
            onAddParticipants: () async {
              final existingIds = room.participants.map((p) => p.user.id).toSet();
              final updatedRoom = await context.push<RoomEntity>(
                RoutePaths.addParticipantsPath(room.id),
                extra: existingIds,
              );
              if (updatedRoom != null && context.mounted) {
                context.read<GroupProfileBloc>().add(GroupProfileEvent.participantsAdded(updatedRoom));
              }
            },
            onPickPhoto: () => _pickAndUploadAvatar(context),
            onChangeName: () => _showChangeNameDialog(context, room.name),
          ),
        );
      },
    );
  }
}