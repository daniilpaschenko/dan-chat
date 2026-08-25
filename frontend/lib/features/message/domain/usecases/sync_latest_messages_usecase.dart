import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/messages_page_entity.dart';
import '../interfaces/i_message_repository.dart';

// используется при реконнекте, домёрживает свежие сообщения
class SyncLatestMessagesUseCase {
  final IMessageRepository _repository;

  const SyncLatestMessagesUseCase(this._repository);

  Future<Either<Failure, MessagesPageEntity>> call({required String roomId}) {
    return _repository.syncLatestMessages(roomId: roomId);
  }
}