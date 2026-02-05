import 'package:dartz/dartz.dart';


import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart'; // Assuming you have a base UseCase class
import '../../data/repositories/auth_repository.dart';
import '../entities/user_entity.dart';
import 'login_params.dart';


class LoginUser implements UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUser(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await repository.loginUser(params);
  }
}
