import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/message.dart';
import '../../data/models/messages_page.dart';

abstract class IMessageRepository {
  Future<Either<Failure, MessagesPage>> getRoomMessages({
    required String roomId,
    String? before,
  });

  Future<Either<Failure, Message>> sendMessage({
    required String roomId,
    required String text,
  });
}