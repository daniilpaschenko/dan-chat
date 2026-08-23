import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../interfaces/i_user_repository.dart';

class ChangeUsernameUsecase {
  final IUserRepository _repository;

  const ChangeUsernameUsecase(this._repository);

  Future<Either<Failure, UserEntity>> call(String name) {
    // бэк требует минимум 3 символа и максимум 16
    final trimmed = name.trim();
    if (trimmed.length < 3 || trimmed.length > 16) {
      return Future.value(
        Left(ValidationFailure('Имя пользователя должно содержать от 3 до 16 символов')),
      );
    }

    return _repository.changeUsername(name);
  }
}