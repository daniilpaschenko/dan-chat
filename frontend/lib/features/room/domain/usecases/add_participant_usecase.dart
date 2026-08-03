import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/room_entity.dart';
import '../interfaces/i_room_repository.dart';

class AddParticipantUseCase {
  final IRoomRepository _repository;

  const AddParticipantUseCase(this._repository);

  Future<Either<Failure, RoomEntity>> call({
    required String roomId,
    required String userId,
  }) {
    return _repository.addParticipant(roomId: roomId, userId: userId);
  }
}