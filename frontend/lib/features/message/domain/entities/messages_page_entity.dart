import 'package:freezed_annotation/freezed_annotation.dart';
import 'message_entity.dart';

part 'messages_page_entity.freezed.dart';

@freezed
class MessagesPageEntity with _$MessagesPageEntity {
  const factory MessagesPageEntity({
    required List<MessageEntity> messages,
    String? nextCursor,
    required bool hasMore,
  }) = _MessagesPageEntity;
}