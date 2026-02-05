import 'package:equatable/equatable.dart';

class SignUpParams extends Equatable {
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String middleName;
  final String email;
  final String phoneNumber;
  final String nationalIdentityNumber;
  final String? gender;
  final String role = "Customer";
  final String dateOfBirth;

  const SignUpParams({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.email,
    required this.phoneNumber,
    required this.nationalIdentityNumber,
    this.gender,
    required this.dateOfBirth,
  });

  @override
  List<Object?> get props => [
    username,
    password,
    firstName,
    lastName,
    middleName,
    email,
    phoneNumber,
    nationalIdentityNumber,
    gender,
    role,
  ];
}
