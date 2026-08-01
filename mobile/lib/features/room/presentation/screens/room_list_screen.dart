import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/navigation/auth_state_notifier.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_bar_with_connectivity.dart';
import '../../../../core/widgets/empty_state_text.dart';
import '../../../../core/widgets/error_view.dart';
import '../../domain/entities/room_display_info.dart';
import '../../domain/entities/room_entity.dart';
import '../blocs/room_list_bloc.dart';
import '../blocs/room_list_event.dart';
import '../blocs/room_list_state.dart';
import '../widgets/room_tile.dart';

class RoomListScreen extends StatelessWidget {
  const RoomListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // создаём bloc и сразу же отправляем событие loadRequested
      create: (_) => getIt<RoomListBloc>()..add(const RoomListEvent.loadRequested()),
      // внутри отображаем наш экран, описанный ниже
      child: const _RoomListView(),
    );
  }
}

class _RoomListView extends StatefulWidget {
  const _RoomListView();

  @override
  State<_RoomListView> createState() => _RoomListViewState();
}

class _RoomListViewState extends State<_RoomListView> {
  final _searchController = TextEditingController();
  String _query = ''; // текущий поисковый запрос

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<RoomListItemEntity> _filterRooms(List<RoomListItemEntity> rooms, String? currentUserId) {
    // если пользователь ничего не ввёл
    if (_query.trim().isEmpty) return rooms;
    // убрать лишние пробелы и привести к нижнему регистру
    final lowerQuery = _query.trim().toLowerCase();

    // логика поиска
    return rooms.where((room) {
      if (room.type == RoomType.group) {
        // если группа то искать по названию группы
        return room.name?.toLowerCase().contains(lowerQuery) ?? false;
      }
      // если direct-чат то по имени пользователя т.к. у direct-чата нет имени чата
      return RoomDisplayInfo.otherParticipant(room, currentUserId)
              ?.username
              .toLowerCase()
              .contains(lowerQuery) ?? false;
    }).toList();
  }

  // последнее сообщение в чате
  String? _lastMessagePreview(RoomListItemEntity room) {
    final lastMessage = room.lastMessage;
    if (lastMessage == null || lastMessage.text == null) return null;
    return lastMessage.text;
  }

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);

    // currentUserId читаем напрямую из AuthStateNotifier
    final currentUserId = getIt<AuthStateNotifier>().currentUserId;

    return Scaffold(
      appBar: const AppBarWithConnectivity(
        onlineTitle: 'Сообщения'
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing.form, vertical: spacing.small),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _query = value),
                decoration: InputDecoration(
                  hintText: 'Поиск чатов',
                  prefixIcon: const Icon(Icons.search),
                  fillColor: AppColors.surface,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<RoomListBloc, RoomListState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    failure: (message) => ErrorView(
                      message: message,
                      gap: spacing.medium,
                      onRetry: () => context
                          .read<RoomListBloc>()
                          .add(const RoomListEvent.loadRequested()),
                    ),
                    loaded: (rooms) => _buildList(context, rooms, currentUserId, formGap: spacing.form),
                    refreshing: (rooms) => _buildList(context, rooms, currentUserId, formGap: spacing.form),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    List<RoomListItemEntity> rooms,
    String? currentUserId, {
    required double formGap,
  }) {
    final filtered = _filterRooms(rooms, currentUserId);

    // позволяет обновлять потягиванием вниз
    return RefreshIndicator(
      onRefresh: () async {
        // при обновлении отправляется событие refreshRequested
        context.read<RoomListBloc>().add(const RoomListEvent.refreshRequested());
      },
      child: filtered.isEmpty
          ? EmptyStateText(
              message: rooms.isEmpty ? 'У вас пока нет чатов' : 'Ничего не найдено',
              fillHeight: true,
            )
          // автоматически вставляет разделитель между чатами
          : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final room = filtered[index];
                final info = RoomDisplayInfo.from(room, currentUserId);
                return RoomTile(
                  title: info.title,
                  subtitle: _lastMessagePreview(room),
                  avatarUrl: info.avatarUrl,
                  unreadCount: room.unreadCount,
                  gap: formGap,
                  onTap: () {
                    context.read<RoomListBloc>().add(RoomListEvent.roomOpened(room.id));
                    context.go(
                      RoutePaths.chatRoomPath(room.id),
                      extra: room, // передаём уже загруженный RoomListItemEntity для заголовка
                    );
                  },
                );
              },
            ),
    );
  }
}