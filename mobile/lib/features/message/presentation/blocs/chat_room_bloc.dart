import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_room_messages_usecase.dart';
import '../../domain/usecases/send_message_usecase.dart';
import 'chat_room_event.dart';
import 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final GetRoomMessagesUseCase _getRoomMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  ChatRoomBloc({
    required GetRoomMessagesUseCase getRoomMessagesUseCase,
    required SendMessageUseCase sendMessageUseCase,
  })  : _getRoomMessagesUseCase = getRoomMessagesUseCase,
        _sendMessageUseCase = sendMessageUseCase,
        // roomId подставится первым событием started: временный плейсхолдер, пока событие не обработано
        super(ChatRoomState.initial('')) {
    on<ChatRoomStarted>(_onStarted);
    on<LoadMoreRequested>(_onLoadMoreRequested);
    on<SendMessageRequested>(_onSendMessageRequested);
  }

  Future<void> _onStarted(
    ChatRoomStarted event,
    Emitter<ChatRoomState> emit,
  ) async {
    // эмит состояния initial где isInitialLoading: true (был false)
    emit(ChatRoomState.initial(event.roomId).copyWith(isInitialLoading: true));

    final result = await _getRoomMessagesUseCase(roomId: event.roomId);

    result.fold(
      (failure) => emit(state.copyWith(
        isInitialLoading: false,
        errorMessage: 'Не удалось загрузить сообщения',
      )),
      (page) => emit(state.copyWith(
        isInitialLoading: false,
        messages: page.messages,
        nextCursor: page.nextCursor,
        hasMore: page.hasMore,
        errorMessage: null,
      )),
    );
  }

  Future<void> _onLoadMoreRequested(
    LoadMoreRequested event,
    Emitter<ChatRoomState> emit,
  ) async {
    // не грузим повторно, если уже грузим или больше нечего грузить
    if (state.isLoadingMore || !state.hasMore) return;

    // показываем индикатор загрузки
    emit(state.copyWith(isLoadingMore: true));

    final result = await _getRoomMessagesUseCase(
      roomId: state.roomId,
      before: state.nextCursor,
    );

    result.fold(
      (failure) => emit(state.copyWith(isLoadingMore: false)),
      (page) => emit(state.copyWith(
        isLoadingMore: false,
        // новая (более старая) страница добавляется В НАЧАЛО списка, т.к. список у нас от старых к новым
        messages: [...page.messages, ...state.messages],
        nextCursor: page.nextCursor,
        hasMore: page.hasMore,
      )),
    );
  }

  Future<void> _onSendMessageRequested(
    SendMessageRequested event,
    Emitter<ChatRoomState> emit,
  ) async {
    // идёт отправка
    emit(state.copyWith(isSending: true));

    final result = await _sendMessageUseCase(roomId: state.roomId, text: event.text);

    result.fold(
      (failure) => emit(state.copyWith(isSending: false, errorMessage: 'Не удалось отправить сообщение')),
      (message) => emit(state.copyWith(
        isSending: false,
        // новое сообщение добавляется В КОНЕЦ — оно самое свежее
        messages: [...state.messages, message],
        errorMessage: null,
      )),
    );
  }
}