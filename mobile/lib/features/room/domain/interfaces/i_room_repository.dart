import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/room.dart';

abstract class IRoomRepository {
  Future<Either<Failure, List<RoomListItem>>> getMyRooms();

  Future<Either<Failure, Room>> getRoomById(String roomId);

  Future<Either<Failure, Room>> createRoom({
    required RoomType type,
    String? name,
    String? avatarUrl,
    required List<String> participantIds,
  });

  Future<Either<Failure, Unit>> markRoomAsRead(String roomId);

  Future<Either<Failure, Room>> addParticipant({
    required String roomId,
    required String userId,
  });

  Future<Either<Failure, Room?>> removeParticipant({
    required String roomId,
    required String userId,
  });
}