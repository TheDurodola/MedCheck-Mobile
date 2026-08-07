import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:medcheck/features/auth/data/models/sign_up_request_model.dart';
import 'package:medcheck/features/auth/domain/usecases/sign_up_params.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/app_logger.dart';
import '../../data/datasources/abstract_classes/auth_local_datasource.dart';
import '../../data/datasources/abstract_classes/auth_remote_datasource.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/registration_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/entities/user_entity.dart';

import '../usecases/login_params.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> loginUser(LoginParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final requestModel = SignInRequestModel(
          username: params.username,
          password: params.password,
        );

        final remoteUser = await remoteDataSource.loginUser(requestModel);


        if (remoteUser.role.toUpperCase() != "CONSUMER") {
          return Left(InvalidRoleFailure(message: ""));
        }


        await localDataSource.cacheToken(remoteUser.token);


        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, RegistrationModel>> signUpCustomer(
    SignUpParams params,
  ) async {
    if (!(await networkInfo.isConnected)) {
      return const Left(NetworkFailure(message: "No Internet Connection"));
    }

    try {
      final requestModel = SignUpRequestModel(
        username: params.username,
        password: params.password,
        firstname: params.firstName,
        email: params.email,
        lastname: params.lastName,
        middlename: params.middleName,
        phoneNumber: params.phoneNumber,
        nationalIdentityNumber: params.nationalIdentityNumber,
        dateOfBirth: params.dateOfBirth,
        gender: params.gender,
      );

      final remoteUser = await remoteDataSource.signUpCustomer(requestModel);

      try {
        await localDataSource.cacheFirstname(remoteUser.firstName);
      } catch (cacheError) {
        AppLogger.error(
          'Local caching failed, but registration succeeded: $cacheError',
        );
      }

      return Right(remoteUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      // This now only catches unexpected logic or mapping errors
      return Left(
        ServerFailure(message: "Registration Error: ${e.toString()}"),
      );
    }
  }
}
