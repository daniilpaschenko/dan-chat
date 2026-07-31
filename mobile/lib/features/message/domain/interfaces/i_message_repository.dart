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
}