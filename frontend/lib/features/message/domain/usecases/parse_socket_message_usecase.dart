import '../entities/message_entity.dart';
import '../interfaces/i_message_repository.dart';

// маппинг сырых данных из сокета
class ParseSocketMessageUseCase {
  final IMessageRepository _repository;

  const ParseSocketMessageUseCase(this._repository);

  MessageEntity call(Map<String, dynamic> json) {
    return _repository.mapSocketMessage(json);
  }
}