import '../../../../features/user/data/mappers/user_mapper.dart';

import '../models/message.dart';
import '../models/messages_page.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/entities/messages_page_entity.dart';

// маппинг data-слой -> domain-слой для сообщений

extension AttachmentMapper on Attachment {
  AttachmentEntity toEntity() {
    return AttachmentEntity(
      url: url,
      type: type == AttachmentType.image
          ? AttachmentType.image
          : AttachmentType.file,
      name: name,
      size: size,
    );
  }
}

extension MessageMapper on Message {
  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      room: room,
      sender: sender.toEntity(),
      text: text,
      attachments: attachments.map((a) => a.toEntity()).toList(),
      readBy: readBy,
      editedAt: editedAt,
      isDeleted: isDeleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension MessagesPageMapper on MessagesPage {
  MessagesPageEntity toEntity() {
    return MessagesPageEntity(
      messages: messages.map((m) => m.toEntity()).toList(),
      nextCursor: nextCursor,
      hasMore: hasMore,
    );
  }
}