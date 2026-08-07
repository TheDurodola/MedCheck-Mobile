import 'package:dartz/dartz.dart';
import 'package:medcheck/core/errors/failures.dart';
import 'package:medcheck/features/home/data/datasources/abstract_classes/verification_datasource.dart';
import 'package:medcheck/features/home/data/models/verify_pack_request.dart';
import 'package:medcheck/features/home/data/repositories/verification_repository.dart';
import 'package:medcheck/features/home/domain/entities/pack_entity.dart';
import 'package:medcheck/features/home/domain/entities/sachet_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../usecases/verification_params.dart';

class VerificationRepositoryImpl extends VerificationRepository {
  final VerificationDatasource remoteDataSource;
  final NetworkInfo networkInfo;

  VerificationRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, PackEntity>> verifyPack(VerificationParams params) async {

    if (await networkInfo.isConnected) {
      try {
        final requestModel = VerifyPackRequest(verificationCode: params.packVerificationCode
        );

        final remoteUser = await remoteDataSource.verifyPack(requestModel);


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
  Future<Either<Failure, SachetEntity>> verifySachet(VerificationParams params) {
    // TODO: implement verifySachet
    throw UnimplementedError();
  }
}