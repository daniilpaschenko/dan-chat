import '../entities/room_entity.dart';
import '../interfaces/i_room_repository.dart';

// маппинг сырых данных из сокета в доменную сущность
class ParseSocketRoomUseCase {
  final IRoomRepository _repository;

  const ParseSocketRoomUseCase(this._repository);

  RoomListItemEntity call(Map<String, dynamic> json) {
    return _repository.mapSocketRoom(json);
  }
}