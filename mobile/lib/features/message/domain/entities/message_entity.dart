import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/data/models/user_model.dart'; // TODO: domain/entities/user_entity.dart

part 'message_entity.freezed.dart';

enum AttachmentType { image, file }

// доменная под-сущность для прикреплённого файла
@freezed
class AttachmentEntity with _$AttachmentEntity {
  const factory AttachmentEntity({
    required String url,
    @Default(AttachmentType.file) AttachmentType type,
    String? name,
    int? size,
  }) = _AttachmentEntity;
}

@freezed
class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
    required String id,
    required String room,
    required PartialUser sender, // TODO: PartialUserEntity
    @Default('') String text,
    @Default([]) List<AttachmentEntity> attachments,
    @Default([]) List<String> readBy,
    DateTime? editedAt,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MessageEntity;
}