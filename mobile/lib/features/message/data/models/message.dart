import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/data/models/user_model.dart';
import '../../domain/entities/message_entity.dart' show AttachmentType;

part 'message.freezed.dart';
part 'message.g.dart';

// под-схема для прикреплённого файла к сообщению
@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    required String url,
    @Default(AttachmentType.file) AttachmentType type,
    String? name,
    int? size,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String room,
    required PartialUser sender, // populate('sender', 'username avatarUrl') — всегда объект
    @Default('') String text,
    @Default([]) List<Attachment> attachments,
    @Default([]) List<String> readBy,
    DateTime? editedAt,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}