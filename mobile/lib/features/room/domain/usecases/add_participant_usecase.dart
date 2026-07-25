import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/room.dart';
import '../interfaces/i_room_repository.dart';

class AddParticipantUseCase {
  final IRoomRepository _repository;

  const AddParticipantUseCase(this._repository);

  Future<Either<Failure, Room>> call({
    required String roomId,
    required String userId,
  }) {
    return _repository.addParticipant(roomId: roomId, userId: userId);
  }
}