import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

class GroupProfileScreen extends StatelessWidget {
  final String roomId;

  const GroupProfileScreen({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GroupProfileBloc>(param1: roomId)..add(const GroupProfileEvent.started()),
      child: const _GroupProfileView(),
    );
  }
}

class _GroupProfileView extends StatelessWidget {
  const _GroupProfileView();

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final currentUserId = getIt<AuthStateNotifier>().currentUserId;

    return BlocConsumer<GroupProfileBloc, GroupProfileState>(
      listenWhen: (previous, current) =>
          current is GroupProfileLoaded
          && (current.errorMessage != null || current.removedRemotely),
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
          loaded: (room, isRemoving, errorMessage, removedRemotely) => GroupProfileContent(
            room: room,
            currentUserId: currentUserId,
            isRemoving: isRemoving,
            onRemoveParticipant: (userId) =>
                context.read<GroupProfileBloc>().add(GroupProfileEvent.participantRemoveRequested(userId)),
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
          ),
        );
      },
    );
  }
}