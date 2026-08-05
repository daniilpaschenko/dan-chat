import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/message_entity.dart';
import '../../../user/domain/entities/user_entity.dart';

part 'chat_room_state.freezed.dart';

@freezed
class ChatRoomState with _$ChatRoomState {
  const factory ChatRoomState({
    required String roomId,
    @Default([]) List<MessageEntity> messages, // от старых к новым
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isSending,
    String? nextCursor,
    @Default(true) bool hasMore,
    String? errorMessage,
    // userId -> username, кто сейчас печатает (кроме нас самих)
    @Default({}) Map<String, String> typingUsers,
    @Default({}) Map<String, UserStatus> participantsStatus,
    @Default({}) Map<String, DateTime> participantsLastSeen,
    @Default(false) bool roomRemoved, // true после успешного delete/leave — экран должен закрыться
  }) = _ChatRoomState;

  factory ChatRoomState.initial(String roomId) => ChatRoomState(roomId: roomId);
}