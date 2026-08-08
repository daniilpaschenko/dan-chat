import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/navigation/auth_state_notifier.dart';
import '../../../../core/navigation/bottom_nav_visibility.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/small_loader.dart';
import '../../../room/domain/entities/room_entity.dart';
import '../blocs/chat_room_bloc.dart';
import '../blocs/chat_room_event.dart';
import '../blocs/chat_room_state.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';

class ChatRoomScreen extends StatelessWidget {
  final String roomId;

  // ради заголовка страницы (получаем тем самым без нового запроса)
  final RoomListItemEntity? room;

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
  final RoomListItemEntity? room;

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

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);
    final currentUserId = getIt<AuthStateNotifier>().currentUserId;

    return Scaffold(
      appBar: ChatAppBar(room: widget.room, currentUserId: currentUserId),
      body: SafeArea(
        child: BlocConsumer<ChatRoomBloc, ChatRoomState>(
          // если ошибка изменилась, то вызвать listener
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage ||
              previous.roomRemoved != current.roomRemoved,
          listener: (context, state) {
            // ошибка сервера, то
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                // показать снизу её содержимое
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
            // если чат был удал
            if (state.roomRemoved) {
              context.pop(); // возвращаемся в список чатов
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
                          ? const Center(
                              child: Text(
                                'Сообщений пока нет',
                                style: TextStyle(color: AppColors.textSecondary),
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
                                    child: Center(child: SmallLoader(size: spacing.loaderSize)),
                                  );
                                }
                                // получаем сообщение
                                final message = state.messages[state.messages.length - 1 - index];
                                // по айди проверяем наше ли оно
                                final isMine = message.sender.id == currentUserId;
                                // передаём эти параметры в "пузырик" сообщения
                                return MessageBubble(
                                  message: message,
                                  isMine: isMine,
                                  gap: spacing.small,
                                  spacing: spacing,
                                  currentUserId: currentUserId,
                                  roomType: widget.room?.type ?? RoomType.direct
                                );
                              },
                            ),
                ),
                MessageInput(
                  controller: _textController,
                  isSending: state.isSending,
                  onSend: () => _sendMessage(context),
                  onChanged: (text) => context.read<ChatRoomBloc>().add(ChatRoomEvent.typingTextChanged(text)),
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