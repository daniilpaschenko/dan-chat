import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/room_entity.dart';
import '../interfaces/i_room_repository.dart';

// повышение участника до admin/понижение обратно до member
class UpdateParticipantRoleUseCase {
  final IRoomRepository _repository;

  UpdateParticipantRoleUseCase(this._repository);

  Future<Either<Failure, RoomEntity>> call({
    required String roomId,
    required String userId,
    required ParticipantRole role,
  }) {
    return _repository.updateParticipantRole(roomId: roomId, userId: userId, role: role);
  }
}