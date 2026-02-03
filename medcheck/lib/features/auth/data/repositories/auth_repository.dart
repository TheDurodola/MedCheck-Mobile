import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_params.dart';


abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginUser(LoginParams params);
}