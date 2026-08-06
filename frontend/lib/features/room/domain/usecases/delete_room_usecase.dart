import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../interfaces/i_room_repository.dart';

class DeleteRoomUseCase {
  final IRoomRepository _repository;

  const DeleteRoomUseCase(this._repository);

  Future<Either<Failure, void>> call(String roomId) {
    return _repository.deleteRoom(roomId);
  }
}