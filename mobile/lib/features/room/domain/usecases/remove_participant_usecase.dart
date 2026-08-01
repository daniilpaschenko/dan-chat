import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/room_entity.dart';
import '../interfaces/i_room_repository.dart';

class RemoveParticipantUseCase {
  final IRoomRepository _repository;

  const RemoveParticipantUseCase(this._repository);

  Future<Either<Failure, RoomEntity?>> call({
    required String roomId,
    required String userId,
  }) {
    return _repository.removeParticipant(roomId: roomId, userId: userId);
  }
}