import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/dio_exception_mapper.dart';
import '../../domain/interfaces/i_user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../models/user_model.dart';

class UserRepository implements IUserRepository {
  final UserRemoteDatasource _remoteDatasource;

  const UserRepository(this._remoteDatasource);

  @override
  Future<Either<Failure, List<PartialUser>>> searchUsers(String query) async {
    try {
      final users = await _remoteDatasource.search(query: query);
      return Right(users);
    } on DioException catch (e) {
      // override не нужен т.к. логика та же
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }
}