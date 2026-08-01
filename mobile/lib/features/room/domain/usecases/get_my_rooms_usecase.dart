import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/room_entity.dart';
import '../interfaces/i_room_repository.dart';

class GetMyRoomsUseCase {
  final IRoomRepository _repository;

  const GetMyRoomsUseCase(this._repository);

  Future<Either<Failure, List<RoomListItemEntity>>> call() {
    return _repository.getMyRooms();
  }
}