import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'messages_page.freezed.dart';
part 'messages_page.g.dart';

@freezed
class MessagesPage with _$MessagesPage {
  const factory MessagesPage({
    required List<Message> messages,
    String? nextCursor,
    required bool hasMore,
  }) = _MessagesPage;

  factory MessagesPage.fromJson(Map<String, dynamic> json) =>
      _$MessagesPageFromJson(json);
}