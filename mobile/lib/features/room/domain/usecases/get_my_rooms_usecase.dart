import 'package:dartz/dartz.dart';
import '../../../../core/models/failures.dart';
import '../../data/models/room.dart';
import '../interfaces/i_room_repository.dart';

class GetMyRoomsUseCase {
  final IRoomRepository _repository;

  const GetMyRoomsUseCase(this._repository);

  Future<Either<Failure, List<RoomListItem>>> call() {
    return _repository.getMyRooms();
  }
}