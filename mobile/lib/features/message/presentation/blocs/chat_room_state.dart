import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/message_entity.dart';

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
  }) = _ChatRoomState;

  factory ChatRoomState.initial(String roomId) => ChatRoomState(roomId: roomId);
}