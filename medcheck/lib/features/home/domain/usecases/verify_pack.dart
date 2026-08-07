

import 'package:dartz/dartz.dart';
import 'package:medcheck/features/home/data/repositories/verification_repository.dart';
import 'package:medcheck/features/home/domain/entities/pack_entity.dart';
import 'package:medcheck/features/home/domain/usecases/verification_params.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';


class VerifyPack extends UseCase<PackEntity, VerificationParams> {
  final VerificationRepository repository;

  VerifyPack(this.repository);
  @override
  Future<Either<Failure, PackEntity>> call(VerificationParams params) async {
    return await repository.verifyPack(params);
  }
}
