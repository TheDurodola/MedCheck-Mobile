import 'package:dartz/dartz.dart';
import 'package:medcheck/core/errors/failures.dart';
import 'package:medcheck/features/auth/data/models/registration_model.dart';
import 'package:medcheck/features/auth/domain/entities/user_entity.dart';
import 'package:medcheck/features/auth/domain/usecases/sign_up_params.dart';

import '../../domain/usecases/login_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginUser(LoginParams params);
  Future<Either<Failure, RegistrationModel>> signUpCustomer(SignUpParams params);
}