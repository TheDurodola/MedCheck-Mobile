import 'package:medcheck/features/auth/data/models/registration_model.dart';

class SignUpRequestModel {
  final String username;
  final String password;
  final String firstname;
  final String lastname;
  final String middlename;
  final String phoneNumber;
  final String nationalIdentityNumber;
  final String dateOfBirth;
  final String? gender;
  final String email;

  SignUpRequestModel({
    required this.username,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.middlename,
    required this.phoneNumber,
    required this.nationalIdentityNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      'username': username,
      'password': password,
      'role': "CONSUMER",
      "firstName": firstname,
      "middleName": middlename,
      'lastName': lastname,
      "phoneNumber": phoneNumber,
      'nationalIdentityNumber': nationalIdentityNumber,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
    };
  }
}
