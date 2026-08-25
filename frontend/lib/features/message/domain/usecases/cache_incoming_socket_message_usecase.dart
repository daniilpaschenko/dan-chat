import '../interfaces/i_message_repository.dart';

// кэшируем входящее socket-сообщение локально; не влияет на UI-состояние
class CacheIncomingSocketMessageUseCase {
  final IMessageRepository _repository;

  const CacheIncomingSocketMessageUseCase(this._repository);

  Future<void> call({
    required String roomId,
    required Map<String, dynamic> json,
  }) {
    return _repository.cacheIncomingSocketMessage(roomId: roomId, json: json);
  }
}