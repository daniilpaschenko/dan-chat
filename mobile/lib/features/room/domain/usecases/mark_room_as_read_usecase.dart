import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../interfaces/i_room_repository.dart';

class MarkRoomAsReadUseCase {
  final IRoomRepository _repository;

  const MarkRoomAsReadUseCase(this._repository);

  Future<Either<Failure, Unit>> call(String roomId) {
    return _repository.markRoomAsRead(roomId);
  }
}