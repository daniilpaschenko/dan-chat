import 'package:dartz/dartz.dart';
import '../entities/room_entity.dart';
import '../../../../core/errors/failures.dart';
import '../interfaces/i_room_repository.dart';

class ChangeGroupNameUsecase {
  final IRoomRepository _repository;

  const ChangeGroupNameUsecase(this._repository);

  Future<Either<Failure, RoomEntity>> call(String roomId, String name) {
    return _repository.changeGroupName(roomId, name);
  }
}