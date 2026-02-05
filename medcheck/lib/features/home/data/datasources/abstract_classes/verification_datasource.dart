import '../../models/pack_model.dart';
import '../../models/sachet_model.dart';
import '../../models/verify_pack_request.dart';
import '../../models/verify_sachet_request.dart';

abstract class VerificationDatasource {
  Future<PackModel> verifyPack(VerifyPackRequest request);
  Future<SachetModel> verifySachet(VerifySachetRequest request);
}


