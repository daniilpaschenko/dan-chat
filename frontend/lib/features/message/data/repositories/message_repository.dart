import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/dio_exception_mapper.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/entities/messages_page_entity.dart';
import '../../domain/interfaces/i_message_repository.dart';
import '../datasources/message_remote_datasource.dart';
import '../datasources/message_local_datasource.dart';
import '../mappers/message_mapper.dart';
import '../models/message.dart';

class MessageRepository implements IMessageRepository {
  final MessageRemoteDatasource _remoteDatasource;
  final MessageLocalDatasource _localDatasource;

  const MessageRepository(this._remoteDatasource, this._localDatasource);

  @override
  Future<Either<Failure, MessagesPageEntity>> getRoomMessages({
    required String roomId,
    String? before,
  }) async {
    try {
      final page = await _remoteDatasource.getRoomMessages(roomId: roomId, before: before);
      // если первая загрузка, т.е. нет курсорной пагинации
      if (before == null) {
        // сохраняем как первую страницу
        await _localDatasource.cacheFirstPage(
          roomId: roomId,
          messages: page.messages,
        );
      } else {
        // иначе добавляем еще старые сообщения
        await _localDatasource.appendOlderMessages(
          roomId: roomId,
          olderMessages: page.messages,
        );
      }
      return Right(page.toEntity());
    } on DioException catch (e) {
      // если это первая загрузка, пробуем показать локальный кэш
      if (before == null) {
        final cached = await _localDatasource.getCachedMessages(roomId);
        if (cached.isNotEmpty) {
          return Right(
            MessagesPageEntity(
              messages: cached.map((m) => m.toEntity()).toList(),
              nextCursor: null,
              hasMore: false,
            ),
          );
        }
      }
      return Left(mapDioExceptionToFailure(
        e,
        statusOverride: (statusCode, message) {
          switch (statusCode) {
            case 403:
              return Failure.validation(message);
            default:
              return null;
          }
        },
      ));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendMessage({
    required String roomId,
    required String text,
  }) async {
    try {
      final message = await _remoteDatasource.createMessage(roomId: roomId, text: text);
      await _localDatasource.addNewMessage(roomId: roomId, message: message);
      return Right(message.toEntity());
    } on DioException catch (e) {
      return Left(mapDioExceptionToFailure(
        e,
        statusOverride: (statusCode, message) {
          switch (statusCode) {
            case 403:
              return Failure.validation(message);
            default:
              return null;
          }
        },
      ));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  MessageEntity mapSocketMessage(Map<String, dynamic> json) {
    return Message.fromJson(json).toEntity();
  }
}