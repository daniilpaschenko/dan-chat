import 'package:cross_file/cross_file.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/room_entity.dart';
import '../interfaces/i_room_repository.dart';

class UploadRoomAvatarUseCase {
  final IRoomRepository _repository;
  const UploadRoomAvatarUseCase(this._repository);

  Future<Either<Failure, RoomEntity>> call({
    required String roomId,
    required XFile file,
  }) => _repository.uploadRoomAvatar(roomId: roomId, file: file);
}