import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/data/models/user_model.dart';
import '../../domain/entities/message_entity.dart' show AttachmentType;

part 'message.freezed.dart';
part 'message.g.dart';

// соответствует enum'у type в Message.js: 'text' | 'system'
enum MessageType {
  @JsonValue('text')
  text,
  @JsonValue('system')
  system,
}

// соответствует enum'у systemData.action в Message.js
enum SystemAction {
  @JsonValue('participant_added')
  participantAdded,
  @JsonValue('participant_removed')
  participantRemoved,
  @JsonValue('participant_left')
  participantLeft,
  @JsonValue('participant_promoted')
  participantPromoted,
  @JsonValue('participant_demoted')
  participantDemoted,
}

// соответствует под-схеме systemData — присутствует только когда type == system
@freezed
class SystemData with _$SystemData {
  const factory SystemData({
    required SystemAction action,
    required PartialUser target,
  }) = _SystemData;

  factory SystemData.fromJson(Map<String, dynamic> json) =>
      _$SystemDataFromJson(json);
}

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
    @Default(MessageType.text) MessageType type,
    SystemData? systemData,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}