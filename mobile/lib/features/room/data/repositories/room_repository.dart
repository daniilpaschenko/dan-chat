import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/dio_exception_mapper.dart';
import '../../domain/interfaces/i_room_repository.dart';
import '../datasources/room_remote_datasource.dart';
import '../datasources/room_local_datasource.dart';
import '../models/room.dart';

class RoomRepository implements IRoomRepository {
  final RoomRemoteDatasource _remoteDatasource;
  final RoomLocalDatasource _localDatasource;

  const RoomRepository(this._remoteDatasource, this._localDatasource);

  @override
  Future<Either<Failure, List<RoomListItem>>> getMyRooms() async {
    try {
      final rooms = await _remoteDatasource.getMyRooms();
      // сеть отработала — обновляем кэш свежими данными
      await _localDatasource.cacheRooms(rooms);
      return Right(rooms);
    } on DioException catch (e) {
      // сети нет / сервер недоступен — пробуем отдать то, что есть локально,
      // чтобы юзер видел список чатов, а не пустой экран ошибки
      final cached = _localDatasource.getCachedRooms();
      if (cached != null) return Right(cached);

      return Left(_mapDioException(e));
    } catch (e) {
      final cached = _localDatasource.getCachedRooms();
      if (cached != null) return Right(cached);

      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Room>> getRoomById(String roomId) async {
    try {
      final room = await _remoteDatasource.getRoomById(roomId);
      return Right(room);
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Room>> createRoom({
    required RoomType type,
    String? name,
    String? avatarUrl,
    required List<String> participantIds,
  }) async {
    try {
      final room = await _remoteDatasource.createRoom(
        type: type,
        name: name,
        avatarUrl: avatarUrl,
        participantIds: participantIds,
      );
      return Right(room);
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> markRoomAsRead(String roomId) async {
    try {
      await _remoteDatasource.markRoomAsRead(roomId);

      // обновляем и локальный кэш, чтобы при следующем офлайн-открытии список не показывал устаревший unreadCount
      final cached = _localDatasource.getCachedRooms();
      if (cached != null) {
        final updated = cached
            .map((r) => r.id == roomId ? r.copyWith(unreadCount: 0) : r)
            .toList();
        await _localDatasource.cacheRooms(updated);
      }

      return const Right(unit);
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Room>> addParticipant({
    required String roomId,
    required String userId,
  }) async {
    try {
      final room = await _remoteDatasource.addParticipant(
        roomId: roomId,
        userId: userId,
      );
      return Right(room);
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Room?>> removeParticipant({
    required String roomId,
    required String userId,
  }) async {
    try {
      final room = await _remoteDatasource.removeParticipant(
        roomId: roomId,
        userId: userId,
      );
      return Right(room); // room = Room/null — оба являются валидным успешным случаем
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  Failure _mapDioException(DioException e) {
    return mapDioExceptionToFailure(
      e,
      statusOverride: (statusCode, message) {
        switch (statusCode) {
          case 403:
          case 404:
            return Failure.validation(message);
          default:
            return null;
        }
      },
    );
  }
}