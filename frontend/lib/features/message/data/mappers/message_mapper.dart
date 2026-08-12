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

// маппинг enum'ов type/action data -> domain (имена совпадают 1 в 1, но слои разделены сознательно —
// domain не должен знать про data-модели)
extension _MessageTypeMapper on MessageType {
  MessageTypeEntity toEntity() {
    switch (this) {
      case MessageType.text:
        return MessageTypeEntity.text;
      case MessageType.system:
        return MessageTypeEntity.system;
    }
  }
}

extension _SystemActionMapper on SystemAction {
  SystemMessageAction toEntity() {
    switch (this) {
      case SystemAction.participantAdded:
        return SystemMessageAction.participantAdded;
      case SystemAction.participantRemoved:
        return SystemMessageAction.participantRemoved;
      case SystemAction.participantLeft:
        return SystemMessageAction.participantLeft;
      case SystemAction.participantPromoted:
        return SystemMessageAction.participantPromoted;
      case SystemAction.participantDemoted:
        return SystemMessageAction.participantDemoted;
    }
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
      type: type.toEntity(),
      systemAction: systemData?.action.toEntity(),
      systemTarget: systemData?.target.toEntity(),
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