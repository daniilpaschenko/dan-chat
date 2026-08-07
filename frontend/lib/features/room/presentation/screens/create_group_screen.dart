import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/small_loader.dart';
import '../blocs/group/create_group_bloc.dart';
import '../blocs/group/create_group_event.dart';
import '../blocs/group/create_group_state.dart';
import '../widgets/selectable_user_tile.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateGroupBloc>(),
      child: const _CreateGroupView(),
    );
  }
}

class _CreateGroupView extends StatefulWidget {
  const _CreateGroupView();

  @override
  State<_CreateGroupView> createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<_CreateGroupView> {
  final _nameController = TextEditingController();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Новая группа')),
      body: BlocConsumer<CreateGroupBloc, CreateGroupState>(
        listenWhen: (previous, current) =>
            previous.createdRoom != current.createdRoom ||
            previous.createErrorMessage != current.createErrorMessage,
        listener: (context, state) {
          if (state.createErrorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.createErrorMessage!)),
            );
          }
          if (state.createdRoom != null) {
            context.go(RoutePaths.chatRoomPath(state.createdRoom!.id));
          }
        },
        builder: (context, state) {
          // если есть название группы, выбран хотя бы 1 участник и процесс создания группы еще не запущен
          final canCreate = _nameController.text.trim().isNotEmpty && !state.isCreating && state.selectedUsers.isNotEmpty;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.form, vertical: spacing.small),
                child: TextField(
                  controller: _nameController,
                  inputFormatters: [
                    // лимит на длину в названии группы
                    LengthLimitingTextInputFormatter(24),
                  ],
                  onChanged: (_) => setState(() {}), // чтобы пересчитать canCreate
                  decoration: const InputDecoration(hintText: 'Название группы'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.form),
                child: TextField(
                  controller: _searchController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  onChanged: (value) => context.read<CreateGroupBloc>().add(
                      CreateGroupEvent.queryChanged(value),
                      ),
                  decoration: const InputDecoration(
                    hintText: 'Поиск людей',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.form, vertical: spacing.small * 0.5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    state.selectedUsers.isNotEmpty ? 'Выбрано: ${state.selectedUsers.length}' : 'Выберите хотя бы 1 участника',
                    style: TextStyle(
                      color: state.selectedUsers.isNotEmpty ? AppColors.textSecondary : AppColors.error,
                      fontSize: spacing.captionSize * 1.2
                    ),
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
                            onTap: () => context.read<CreateGroupBloc>().add(
                                  CreateGroupEvent.userToggled(user),
                                ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.all(spacing.form),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: canCreate
                        ? () => context.read<CreateGroupBloc>().add(
                              CreateGroupEvent.createRequested(_nameController.text),
                            )
                        : null,
                    child: state.isCreating
                        ? SmallLoader(size: spacing.loaderSize)
                        : const Text('Создать'),
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