import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/small_loader.dart';
import '../blocs/group/add_participants_bloc.dart';
import '../blocs/group/add_participants_event.dart';
import '../blocs/group/add_participants_state.dart';
import '../widgets/selectable_user_tile.dart';

class AddParticipantsScreen extends StatelessWidget {
  final String roomId;
  final Set<String> existingParticipantIds;

  const AddParticipantsScreen({
    super.key,
    required this.roomId,
    required this.existingParticipantIds,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddParticipantsBloc>(param1: roomId, param2: existingParticipantIds),
      child: const _AddParticipantsView(),
    );
  }
}

class _AddParticipantsView extends StatefulWidget {
  const _AddParticipantsView();

  @override
  State<_AddParticipantsView> createState() => _AddParticipantsViewState();
}

class _AddParticipantsViewState extends State<_AddParticipantsView> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Добавить участников')),
      body: BlocConsumer<AddParticipantsBloc, AddParticipantsState>(
        listenWhen: (previous, current) =>
            previous.updatedRoom != current.updatedRoom ||
            previous.submitErrorMessage != current.submitErrorMessage,
        listener: (context, state) {
          if (state.submitErrorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.submitErrorMessage!)),
            );
          }
          if (state.updatedRoom != null) {
            context.pop(state.updatedRoom);
          }
        },
        builder: (context, state) {
          final canSubmit = state.selectedUsers.isNotEmpty && !state.isSubmitting;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.form, vertical: spacing.small),
                child: TextField(
                  controller: _searchController,
                  inputFormatters: [LengthLimitingTextInputFormatter(16)],
                  onChanged: (value) =>
                      context.read<AddParticipantsBloc>().add(AddParticipantsEvent.queryChanged(value)),
                  decoration: const InputDecoration(
                    hintText: 'Поиск людей',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              if (state.selectedUsers.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacing.form, vertical: spacing.small * 0.5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Выбрано: ${state.selectedUsers.length}',
                      style: TextStyle(color: AppColors.textSecondary, fontSize: spacing.captionSize * 1.2),
                    ),
                  ),
                ),
              Expanded(
                child: state.isSearching
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: state.searchResults.length,
                        itemBuilder: (context, index) {
                          final user = state.searchResults[index];
                          final isSelected = state.selectedUsers.containsKey(user.id);
                          return SelectableUserTile(
                            user: user,
                            isSelected: isSelected,
                            gap: spacing.form,
                            onTap: () =>
                                context.read<AddParticipantsBloc>().add(AddParticipantsEvent.userToggled(user)),
                          );
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.all(spacing.form),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: canSubmit
                        ? () => context.read<AddParticipantsBloc>().add(const AddParticipantsEvent.submitRequested())
                        : null,
                    child: state.isSubmitting
                        ? SmallLoader(size: spacing.loaderSize)
                        : const Text('Добавить'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}