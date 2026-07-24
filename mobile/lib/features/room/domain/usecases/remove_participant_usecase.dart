import 'package:dartz/dartz.dart';
import '../../../../core/models/failures.dart';
import '../../data/models/room.dart';
import '../interfaces/i_room_repository.dart';

class RemoveParticipantUseCase {
  final IRoomRepository _repository;

  const RemoveParticipantUseCase(this._repository);

  Future<Either<Failure, Room?>> call({
    required String roomId,
    required String userId,
  }) {
    return _repository.removeParticipant(roomId: roomId, userId: userId);
  }
}