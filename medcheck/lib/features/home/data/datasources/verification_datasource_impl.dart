import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:medcheck/features/auth/data/datasources/abstract_classes/auth_local_datasource.dart';
import 'package:medcheck/features/home/data/datasources/abstract_classes/verification_datasource.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/pack_model.dart';
import '../models/sachet_model.dart';
import '../models/verify_pack_request.dart';
import '../models/verify_sachet_request.dart';

class VerificationDatasourceImpl extends VerificationDatasource{
  final http.Client client;
  final AuthLocalDataSource localDataSource;

  VerificationDatasourceImpl(this.client, this.localDataSource);

  @override
  Future<PackModel> verifyPack(VerifyPackRequest request) async {
    final url = Uri.parse(ApiConstants.verifyPack);

    final rawToken = await localDataSource.getLastToken();
    String token = rawToken.toString();


    final response = await client.put(
      url,
      headers: ApiConstants.authHeaders(token ?? ''),
      body: jsonEncode(request.toJson()),
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