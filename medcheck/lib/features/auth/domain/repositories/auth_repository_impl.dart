import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:medcheck/features/auth/data/models/sign_up_request_model.dart';
import 'package:medcheck/features/auth/domain/usecases/sign_up_params.dart';


import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../data/datasources/abstract_classes/auth_local_datasource.dart';
import '../../data/datasources/abstract_classes/auth_remote_datasource.dart';
import '../../data/models/login_request_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_user.dart';


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

        if (kDebugMode) {
          print(remoteUser.token);
        }
        if(remoteUser.role.toUpperCase() != "CONSUMER"){
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
  Future<Either<Failure, UserEntity>> signUpCustomer(SignUpParams params) async {

    if (await networkInfo.isConnected) {
      try {

        final requestModel = SignUpRequestModel(
          username: params.username,
          password: params.password,
        );


        final remoteUser = await remoteDataSource.signUpCustomer(requestModel);







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
}