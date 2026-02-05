import 'package:dartz/dartz.dart';
import 'package:medcheck/features/auth/data/models/registration_model.dart';
import 'package:medcheck/features/auth/domain/usecases/sign_up_params.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart'; // Assuming you have a base UseCase class
import '../../data/repositories/auth_repository.dart';


class SignUpCustomer implements UseCase<RegistrationModel, SignUpParams> {
  final AuthRepository repository;


  SignUpCustomer(this.repository);

  @override
  Future<Either<Failure, RegistrationModel>> call(SignUpParams params) async {
    return await repository.signUpCustomer(params);
  }
}

