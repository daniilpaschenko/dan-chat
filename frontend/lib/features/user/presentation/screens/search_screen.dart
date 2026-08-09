import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_bar_with_connectivity.dart';
import '../blocs/search/search_bloc.dart';
import '../blocs/search/search_event.dart';
import '../blocs/search/search_state.dart';
import '../widgets/user_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchBloc>(),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
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
      appBar: const AppBarWithConnectivity(
        onlineTitle: 'Поиск пользователей'
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing.form, vertical: spacing.small),
              child: TextField(
                controller: _searchController,
                autofocus: true,
                onChanged: (value) {
                  // просто пробрасываем каждое изменение в bloc — debounce и защита от гонки уже внутри SearchBloc
                  context.read<SearchBloc>().add(SearchEvent.queryChanged(value));
                },
                decoration: InputDecoration(
                  hintText: 'Введите имя пользователя',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _searchController,
                    builder: (context, value, _) {
                      if (value.text.isEmpty) return const SizedBox.shrink();
                      return IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          context.read<SearchBloc>().add(const SearchEvent.queryChanged(''));
                        },
                      );
                    },
                  ),
                  fillColor: AppColors.surface,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: spacing.medium),
                        child: Text(
                          'Начните вводить имя пользователя',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.textSecondary, fontSize: spacing.titleSize * 0.7),
                        ),
                      ),
                    ),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    failure: (message) => Center(
                      child: Text(message, style: const TextStyle(color: AppColors.textSecondary)),
                    ),
                    loaded: (users) {
                      if (users.isEmpty) {
                        return const Center(
                          child: Text(
                            'Пользователи не найдены',
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return UserTile(
                            user: user,
                            gap: spacing.form,
                            onTap: () {
                              // ведём на профиль этого юзера
                              context.push(
                                RoutePaths.userProfile.replaceFirst(':userId', user.id),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}