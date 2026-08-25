import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/message_entity.dart';
import '../entities/messages_page_entity.dart';

abstract class IMessageRepository {
  Future<Either<Failure, MessagesPageEntity>> getRoomMessages({
    required String roomId,
    String? before,
  });

  Future<Either<Failure, MessageEntity>> sendMessage({
    required String roomId,
    required String text,
  });

  // синхронный маппинг сырых данных т.к. presentation не должен трогать data-модели напрямую
  MessageEntity mapSocketMessage(Map<String, dynamic> json);

  // асинхронно кэшируем входящее socket-сообщение локально (не влияет на UI-состояние)
  Future<void> cacheIncomingSocketMessage({
    required String roomId,
    required Map<String, dynamic> json,
  });

  // подтягиваем самые свежие сообщения (после реконнекта), не затирая уже подгруженную историю
  Future<Either<Failure, MessagesPageEntity>> syncLatestMessages({
    required String roomId,
  });

  // очищаем локальный кэш сообщений комнаты (например при удалении/выходе из чата)
  Future<void> clearCachedMessages(String roomId);
}