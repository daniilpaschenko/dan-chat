import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/message_entity.dart';
import '../interfaces/i_message_repository.dart';

class SendMessageUseCase {
  final IMessageRepository _repository;

  const SendMessageUseCase(this._repository);

  Future<Either<Failure, MessageEntity>> call({
    required String roomId,
    required String text,
  }) {
    final trimmed = text.trim();

    // пустое сообщение не должно уходить на бэк — заранее отсекаем на всякий случай
    if (trimmed.isEmpty) {
      return Future.value(const Left(Failure.validation('Сообщение не может быть пустым')));
    }

    return _repository.sendMessage(roomId: roomId, text: trimmed);
  }
}