import '../interfaces/i_message_repository.dart';

class ClearCachedMessagesUseCase {
  final IMessageRepository _repository;

  const ClearCachedMessagesUseCase(this._repository);

  Future<void> call(String roomId) {
    return _repository.clearCachedMessages(roomId);
  }
}