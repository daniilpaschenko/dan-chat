import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/room.dart';
import '../interfaces/i_room_repository.dart';

class GetRoomByIdUseCase {
  final IRoomRepository _repository;

  const GetRoomByIdUseCase(this._repository);

  Future<Either<Failure, Room>> call(String roomId) {
    return _repository.getRoomById(roomId);
  }
}