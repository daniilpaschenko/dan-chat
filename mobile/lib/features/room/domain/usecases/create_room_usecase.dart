import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/room_entity.dart';
import '../interfaces/i_room_repository.dart';

class CreateRoomUseCase {
  final IRoomRepository _repository;

  const CreateRoomUseCase(this._repository);

  Future<Either<Failure, RoomEntity>> call({
    required RoomType type,
    String? name,
    String? avatarUrl,
    required List<String> participantIds,
  }) {
    // пре-валидация
    final validationError = _validate(
      type: type,
      name: name,
      participantIds: participantIds,
    );
    if (validationError != null) {
      return Future.value(Left(Failure.validation(validationError)));
    }

    return _repository.createRoom(
      type: type,
      name: name,
      avatarUrl: avatarUrl,
      participantIds: participantIds,
    );
  }

  String? _validate({
    required RoomType type,
    String? name,
    required List<String> participantIds,
  }) {
    if (type == RoomType.direct) {
      // предполагаем, что bloc уже передаёт список БЕЗ текущего юзера
      if (participantIds.length != 1) {
        return 'Для личного чата нужен ровно один собеседник';
      }
    }

    if (type == RoomType.group) {
      if (participantIds.isEmpty) {
        return 'Добавьте хотя бы одного участника';
      }
      if (name == null || name.trim().isEmpty) {
        return 'Введите название группы';
      }
    }

    return null;
  }
}