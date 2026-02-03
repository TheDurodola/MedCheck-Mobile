import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:medcheck/features/auth/domain/usecases/sign_up_params.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart'; // Assuming you have a base UseCase class
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignUpCustomer implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository repository;


  SignUpCustomer(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await repository.signUpCustomer(params);
  }
}


class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}