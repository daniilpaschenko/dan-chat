import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../interfaces/i_room_repository.dart';

class LeaveRoomUseCase {
  final IRoomRepository _repository;

  const LeaveRoomUseCase(this._repository);

  Future<Either<Failure, void>> call(String roomId) {
    return _repository.leaveRoom(roomId);
  }
}