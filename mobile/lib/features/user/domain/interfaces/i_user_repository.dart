import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/user_model.dart';

abstract class IUserRepository {
  Future<Either<Failure, List<PartialUser>>> searchUsers(String query);
}