import 'package:cross_file/cross_file.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/room_entity.dart';

abstract class IRoomRepository {
  Future<Either<Failure, List<RoomListItemEntity>>> getMyRooms();

  Future<Either<Failure, RoomEntity>> getRoomById(String roomId);

  Future<Either<Failure, RoomEntity>> createRoom({
    required RoomType type,
    String? name,
    String? avatarUrl,
    required List<String> participantIds,
  });

  Future<Either<Failure, Unit>> markRoomAsRead(String roomId);

  Future<Either<Failure, RoomEntity>> addParticipant({
    required String roomId,
    required String userId,
  });

  Future<Either<Failure, RoomEntity?>> removeParticipant({
    required String roomId,
    required String userId,
  });

  Future<Either<Failure, RoomEntity>> updateParticipantRole({
    required String roomId,
    required String userId,
    required ParticipantRole role,
  });

  Future<Either<Failure, void>> leaveRoom(String roomId);

  Future<Either<Failure, void>> deleteRoom(String roomId);

  Future<Either<Failure, RoomEntity>> uploadRoomAvatar({
    required String roomId,
    required XFile file,
  });

  // синхронный маппинг сырых socket-данных в доменную сущность
  RoomListItemEntity mapSocketRoom(Map<String, dynamic> json);
}