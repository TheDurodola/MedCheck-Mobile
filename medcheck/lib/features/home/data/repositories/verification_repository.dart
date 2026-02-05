import 'package:dartz/dartz.dart';
import 'package:medcheck/features/home/domain/entities/pack_entity.dart';
import 'package:medcheck/features/home/domain/entities/sachet_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/usecases/verification_params.dart';

abstract class VerificationRepository {
  Future<Either<Failure, PackEntity>> verifyPack(VerificationParams params);
  Future<Either<Failure, SachetEntity>> verifySachet(VerificationParams params);
}

