import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medcheck/features/home/data/datasources/abstract_classes/verification_datasource.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/pack_model.dart';
import '../models/sachet_model.dart';
import '../models/verify_pack_request.dart';
import '../models/verify_sachet_request.dart';

class VerificationDatasourceImpl extends VerificationDatasource{
  final http.Client client;

  VerificationDatasourceImpl(this.client);

  @override
  Future<PackModel> verifyPack(VerifyPackRequest request) async {
    final url = Uri.parse("${ApiConstants.verifyPack}/${request.verificationCode}");

    final response = await client.put(
      url,
      headers: ApiConstants.headers,
    );

    if (response.statusCode == 200) {
      return PackModel.fromJson(jsonDecode(response.body));
    } else {
      final message = jsonDecode(response.body)['message'] ?? 'Server Error';
      throw ServerException(message: message);
    }
  }

  @override
  Future<SachetModel> verifySachet(VerifySachetRequest request) {
    // TODO: implement verifySachet
    throw UnimplementedError();
  }
}