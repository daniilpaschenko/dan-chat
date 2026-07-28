import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/navigation/auth_state_notifier.dart';
import '../../../../core/navigation/bottom_nav_visibility.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../room/data/models/room.dart';
import '../../../user/data/models/user_model.dart';
import '../../data/models/message.dart';
import '../blocs/chat_room_bloc.dart';
import '../blocs/chat_room_event.dart';
import '../blocs/chat_room_state.dart';

class ChatRoomScreen extends StatelessWidget {
  final String roomId;

  // ради заголовка страницы (получаем тем самым без нового запроса)
  final RoomListItem? room;

  const ChatRoomScreen({super.key, required this.roomId, this.room});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChatRoomBloc>()..add(ChatRoomEvent.started(roomId)),
      child: _ChatRoomView(room: room),
    );
  }
}

class _ChatRoomView extends StatefulWidget {
  final RoomListItem? room;

  const _ChatRoomView({required this.room});

  @override
  State<_ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<_ChatRoomView> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getIt<BottomNavVisibility>().visible.value = false;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _textController.dispose();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getIt<BottomNavVisibility>().visible.value = true;
    });
    super.dispose();
  }

  // вызывается каждый раз, когда пользователь листает
  void _onScroll() {
    // если экран еще не построился или был уничтожен
    if (!_scrollController.hasClients) return; 
    // когда пользотваель приблизится к концу списка на 200 пикселей
    final threshold = _scrollController.position.maxScrollExtent - 200;
    if (_scrollController.position.pixels >= threshold) {
      // начинаем загрузку еще сообщений
      context.read<ChatRoomBloc>().add(const ChatRoomEvent.loadMoreRequested());
    }
  }

  // isSending теперь читаем из bloc.state прямо здесь
  // обе кнопки отправки одинаково защищены от повторной отправки
  void _sendMessage(BuildContext context) {
    final bloc = context.read<ChatRoomBloc>();
    if (bloc.state.isSending) return;

    final text = _textController.text;
    if (text.trim().isEmpty) return;

    bloc.add(ChatRoomEvent.sendMessageRequested(text));
    _textController.clear();
  }

  // собеседник для direct-чата (или первый участник, если не нашли себя)
  PartialUser? _otherUser(RoomListItem? room, String? currentUserId) {
    if (room == null || room.participants.isEmpty) return null;
    final others = room.participants.where((p) => p.user.id != currentUserId);
    return others.isNotEmpty ? others.first.user : room.participants.first.user;
  }

  // имя чата
  String _roomTitle(RoomListItem? room, String? currentUserId) {
    if (room == null) return 'Чат';

    if (room.type == RoomType.group) return room.name ?? 'Без названия';

    return _otherUser(room, currentUserId)?.username ?? 'Чат';
  }

  // подзаголовок: для группы — число участников, для direct — статус
  String? _roomSubtitle(RoomListItem? room, String? currentUserId) {
    if (room == null) return null;

    if (room.type == RoomType.group) {
      final count = room.participants.length;
      return '$count ${_participantsWord(count)}';
    }

    final other = _otherUser(room, currentUserId);
    if (other == null) return null;

    if (other.status == UserStatus.online) return 'в сети';

    final lastSeen = other.lastSeen;
    if (lastSeen == null) return 'не в сети';
    return 'был(а) в ${_formatLastSeen(lastSeen)}';
  }

  // склонение слова "участник"
  String _participantsWord(int count) {
    final mod10 = count % 10;
    final mod100 = count % 100;
    if (mod10 == 1 && mod100 != 11) return 'участник';
    if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) return 'участника';
    return 'участников';
  }

  String _formatLastSeen(DateTime lastSeen) {
    final now = DateTime.now();
    final diff = now.difference(lastSeen);
    if (diff.inMinutes < 1) return 'только что';
    if (diff.inHours < 1) return '${diff.inMinutes} мин назад';
    if (diff.inDays < 1) return '${diff.inHours} ч назад';
    return '${lastSeen.day.toString().padLeft(2, '0')}.${lastSeen.month.toString().padLeft(2, '0')}';
  }

  // ссылка на аватарку чата: для группы - room.avatarUrl, для direct - аватар собеседника
  String? _roomAvatarUrl(RoomListItem? room, String? currentUserId) {
    if (room == null) return null;
    if (room.type == RoomType.group) return room.avatarUrl;
    return _otherUser(room, currentUserId)?.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final double avatarSize = spacing.medium * 1.3;

    final currentUserId = getIt<AuthStateNotifier>().currentUserId;

    final title = _roomTitle(widget.room, currentUserId);
    final subtitle = _roomSubtitle(widget.room, currentUserId);
    final avatarUrl = _roomAvatarUrl(widget.room, currentUserId);

    return Scaffold(
      appBar: AppBar(
        // выключаем стандартную кнопку назад — рисуем всё сами
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            // стрелка назад -> в chatList
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            SizedBox(width: spacing.small * 0.5),
            // аватарка чата
            ClipOval(
              child: avatarUrl != null
                ? CachedNetworkImage(
                    imageUrl: avatarUrl,
                    width: avatarSize,
                    height: avatarSize,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: avatarSize,
                      height: avatarSize,
                      color: AppColors.primary,
                    ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      radius: avatarSize / 2,
                      backgroundColor: AppColors.primary,
                      child: Text(title.isNotEmpty ? title[0].toUpperCase() : '?'),
                    ),
                  )
                : CircleAvatar(
                    radius: avatarSize / 2,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      title.isNotEmpty ? title[0].toUpperCase() : '?',
                      style: TextStyle(fontSize: spacing.captionSize * 1.7, color: AppColors.textPrimary, fontWeight: FontWeight.w600),
                    ),
                  ),
            ),
            SizedBox(width: spacing.small),
            // название чата и статус/кол-во участников
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: spacing.captionSize * 1.7, fontWeight: FontWeight.w600),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: spacing.captionSize * 1.2, color: AppColors.textSecondary),
                    ),
                ],
              ),
            ),
            // три точки — пока ничего не делают
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<ChatRoomBloc, ChatRoomState>(
          // если ошибка изменилась, то вызвать listener
          listenWhen: (previous, current) => previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            // ошибка сервера, то
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                // показать снизу её содержимое
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded( // занимает всё свободное место
                  child: state.isInitialLoading
                      // если данные еще загружаются -> показываем лоадер
                      ? const Center(child: CircularProgressIndicator())
                      // если сообщений нет еще
                      : state.messages.isEmpty
                          ? Center(
                              child: Text(
                                'Сообщений пока нет',
                                style: const TextStyle(color: AppColors.textSecondary),
                              ),
                            )
                        // сообщения есть, то
                          : ListView.builder(
                              controller: _scrollController,
                              // нижний элемент становится первым
                              reverse: true,
                              padding: EdgeInsets.symmetric(horizontal: spacing.form, vertical: spacing.small),
                              // если есть еще сообщения то показываем на 1 больше
                              itemCount: state.messages.length + (state.hasMore ? 1 : 0),
                              itemBuilder: (context, index) {
                                // последним элементом будет наш кружок загрузки
                                if (index == state.messages.length) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: spacing.small),
                                    child: Center(child: _SmallLoader(size: spacing.loaderSize)),
                                  );
                                }
                                // получаем сообщение
                                final message = state.messages[state.messages.length - 1 - index];
                                // по айди проверяем наше ли оно
                                final isMine = message.sender.id == currentUserId;
                                // передаём эти параметры в "пузырик" сообщения, описанный ниже
                                return _MessageBubble(message: message, isMine: isMine, gap: spacing.small, spacing: spacing);
                              },
                            ),
                ),
                _MessageInput(
                  controller: _textController,
                  isSending: state.isSending,
                  onSend: () => _sendMessage(context),
                  gap: spacing.form,
                  spacing: spacing,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMine;
  final double gap;
  final AppSpacing spacing;

  const _MessageBubble({required this.message, required this.isMine, required this.gap, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Align(
      // если моё то справа, чужое — слева
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        // расстояние между сообщениями
        margin: EdgeInsets.symmetric(vertical: gap * 0.2),
        padding: EdgeInsets.symmetric(horizontal: gap, vertical: gap * 0.5),
        // пузырь не шире этого значения (для переносов)
        constraints: BoxConstraints(maxWidth: spacing.bubbleMaxWidth),
        decoration: BoxDecoration(
          // если сообщение моё то цвет primary, иначе — surface
          color: isMine ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(spacing.bubbleRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // занимает места ровно столько, сколько нужно потомкам
          mainAxisSize: MainAxisSize.min,
          children: [
            // если не моё сообщение
            if (!isMine)
              Padding(
                padding: EdgeInsets.only(bottom: gap * 0.2),
                child: Text(
                  // пишем еще и имя пользователя
                  message.sender.username,
                  style: TextStyle(
                    fontSize: spacing.captionSize,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            Text(
              message.text,
              style: TextStyle(color: isMine ? Colors.white : AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

// общий маленький индикатор загрузки — раньше дублировался
// в списке сообщений и в кнопке отправки
class _SmallLoader extends StatelessWidget {
  final double size;

  const _SmallLoader({required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(strokeWidth: 2),
    );
  }
}

// stateless потому что состояние текста хранится не здесь, а в контроллере
class _MessageInput extends StatelessWidget {
  // вот в этом контроллере
  final TextEditingController controller;
  final bool isSending;
  final VoidCallback onSend;
  final double gap;
  final AppSpacing spacing;

  const _MessageInput({
    required this.controller,
    required this.isSending,
    required this.onSend,
    required this.gap,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // не защищаем верх, потому что там appbar
      top: false,
      child: Padding(
        padding: EdgeInsets.all(gap * 0.5),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                // меняет кнопку на клавиатуре
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => onSend(),
                decoration: InputDecoration(
                  hintText: 'Сообщение',
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: EdgeInsets.symmetric(horizontal: gap, vertical: gap * 0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(spacing.inputRadius),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: gap * 0.3),
            IconButton(
              onPressed: isSending ? null : onSend,
              // если идет отправка, показываем лоадер вместо иконки отправки
              icon: isSending
                  ? _SmallLoader(size: spacing.loaderSize)
                  // иначе саму иконку отправки
                  : const Icon(Icons.send, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}