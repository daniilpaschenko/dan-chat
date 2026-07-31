import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/messages_page_entity.dart';
import '../interfaces/i_message_repository.dart';

class GetRoomMessagesUseCase {
  final IMessageRepository _repository;

  const GetRoomMessagesUseCase(this._repository);

  Future<Either<Failure, MessagesPageEntity>> call({
    required String roomId,
    String? before,
  }) {
    return _repository.getRoomMessages(roomId: roomId, before: before);
  }
}