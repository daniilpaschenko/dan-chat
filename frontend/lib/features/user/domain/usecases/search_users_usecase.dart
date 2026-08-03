import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../interfaces/i_user_repository.dart';

class SearchUsersUseCase {
  final IUserRepository _repository;

  const SearchUsersUseCase(this._repository);

  Future<Either<Failure, List<PartialUserEntity>>> call(String query) {
    // бэк требует минимум 3 символа: короткий запрос отсекаем на клиенте заранее,
    // чтобы не слать его при каждом нажатии клавиши
    final trimmed = query.trim();
    if (trimmed.length < 3) {
      return Future.value(const Right([]));
    }

    return _repository.searchUsers(trimmed);
  }
}