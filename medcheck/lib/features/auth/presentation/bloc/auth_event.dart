import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;

  const LoginRequested({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class RegistrationRequested extends AuthEvent {
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String middleName;
  final String email;
  final String phoneNumber;
  final String nationalIdentityNumber;
  final String gender;
  final String role = "Customer";

  final String dateOfBirth;

  const RegistrationRequested({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.email,
    required this.phoneNumber,
    required this.nationalIdentityNumber,
    required this.gender,
    required this.dateOfBirth,
  });

  @override
  List<Object> get props => [
    username,
    password,
    firstName,
    lastName,
    middleName,
    email,
    phoneNumber,
    nationalIdentityNumber,
    gender,
    dateOfBirth
  ];
}

class LogoutRequested extends AuthEvent {}
