import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/navigation/auth_state_notifier.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../data/models/room.dart';
import '../../../user/data/models/user_model.dart';
import '../blocs/room_list_bloc.dart';
import '../blocs/room_list_event.dart';
import '../blocs/room_list_state.dart';

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

  // собеседник в direct-чате — единственный участник с id != currentUserId
  PartialUser? _otherParticipant(RoomListItem room, String? currentUserId) {
    if (room.participants.isEmpty) return null;
    // откат на "первый участник" чтобы не упасть
    if (currentUserId == null) return room.participants.first.user;

    final others = room.participants.where((p) => p.user.id != currentUserId);
    return others.isNotEmpty ? others.first.user : room.participants.first.user;
  }

  // название комнаты
  String _roomTitle(RoomListItem room, String? currentUserId) {
    // если это группа
    if (room.type == RoomType.group) return room.name ?? 'Без названия';
    // если нет, то только direct-чат
    final other = _otherParticipant(room, currentUserId);
    return other?.username ?? 'Чат';
  }

  // аватарка комнаты
  String? _roomAvatarUrl(RoomListItem room, String? currentUserId) {
    if (room.type == RoomType.group) return room.avatarUrl;

    // для direct-чата аватарка собеседника, а не комнаты
    final other = _otherParticipant(room, currentUserId);
    return other?.avatarUrl;
  }

  List<RoomListItem> _filterRooms(List<RoomListItem> rooms, String? currentUserId) {
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
      return _otherParticipant(room, currentUserId)
              ?.username
              .toLowerCase()
              .contains(lowerQuery) ?? false;
    }).toList();
  }

  // последнее сообщение в чате
  String? _lastMessagePreview(RoomListItem room) {
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
      appBar: AppBar(
        title: const Text('Сообщения'),
        centerTitle: false,
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
                    failure: (message) => _ErrorView(
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) context.go(RoutePaths.search);
          if (index == 2) context.go(RoutePaths.profile);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Чаты'),
          NavigationDestination(icon: Icon(Icons.search_outlined), label: "Поиск"),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Профиль'),
        ],
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    List<RoomListItem> rooms,
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
          ? LayoutBuilder(
              builder: (context, constraints) => ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: constraints.maxHeight,
                    child: Center(
                      child: Text(
                        rooms.isEmpty ? 'У вас пока нет чатов' : 'Ничего не найдено',
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                    ),
                  ),
                ],
              ),
            )
          // автоматически вставляет разделитель между чатами
          : ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: filtered.length,
              // вот этот разделитель
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final room = filtered[index];
                return _RoomTile(
                  title: _roomTitle(room, currentUserId),
                  subtitle: _lastMessagePreview(room),
                  avatarUrl: _roomAvatarUrl(room, currentUserId),
                  unreadCount: room.unreadCount,
                  gap: formGap,
                  onTap: () {
                    context.read<RoomListBloc>().add(RoomListEvent.roomOpened(room.id));
                    context.go(RoutePaths.chatRoom.replaceFirst(':roomId', room.id));
                  },
                );
              },
            ),
    );
  }
}

// один элемент списка - чат
class _RoomTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? avatarUrl;
  final int unreadCount;
  final double gap;
  final VoidCallback onTap;

  const _RoomTile({
    required this.title,
    required this.subtitle,
    required this.avatarUrl,
    required this.unreadCount,
    required this.gap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: gap, vertical: gap * 0.15),
      // круглая аватарка
      leading: CircleAvatar(
        backgroundColor: AppColors.primary,
        backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
        child: avatarUrl == null
        // если нет аватарка покажет первую букву имени (+приведёт к верхнему регистру)
            ? Text(title.isNotEmpty ? title[0].toUpperCase() : '?')
            : null,
      ),
      // ellipsis - если длинное название сделает троеточие
      title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: subtitle != null
          ? Text(subtitle!, maxLines: 1, overflow: TextOverflow.ellipsis)
          : null,
      // счётчик непрочитанных сообщений
      trailing: unreadCount > 0
          ? CircleAvatar(
              radius: gap * 0.33,
              backgroundColor: AppColors.primary,
              child: Text(
                unreadCount > 99 ? '99+' : '$unreadCount',
                style: TextStyle(fontSize: gap * 0.28, color: Colors.white),
              ),
            )
          : null,
    );
  }
}

// экран ошибки
class _ErrorView extends StatelessWidget {
  final String message;
  final double gap;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.gap, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, style: const TextStyle(color: AppColors.textSecondary)),
          SizedBox(height: gap * 0.4),
          TextButton(onPressed: onRetry, child: const Text('Повторить')),
        ],
      ),
    );
  }
}