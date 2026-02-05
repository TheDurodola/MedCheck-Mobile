import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medcheck/features/auth/data/models/sign_up_request_model.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/login_request_model.dart';
import '../models/registration_model.dart';
import '../models/user_model.dart';
import 'abstract_classes/auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> loginUser(SignInRequestModel request) async {
    final url = Uri.parse(ApiConstants.signin);

    final response = await client.post(
      url,
      headers: ApiConstants.headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      final message = jsonDecode(response.body)['message'] ?? 'Server Error';
      throw ServerException(message: message);
    }
  }

  @override
  Future<RegistrationModel> signUpCustomer(SignUpRequestModel request) async {
    final url = Uri.parse(ApiConstants.signup);

    final response = await client.post(
      url,
      headers: ApiConstants.headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return RegistrationModel.fromJson(jsonDecode(response.body));
    } else {
      final message = jsonDecode(response.body)['message'] ?? 'Server Error';
      throw ServerException(message: message);
    }
  }
}
