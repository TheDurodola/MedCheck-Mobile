import 'package:equatable/equatable.dart';


abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends VerificationState {}

class AuthLoading extends VerificationState {}

class AuthAuthenticated extends VerificationState {


  const AuthAuthenticated();

  @override
  List<Object> get props => [];
}

class AuthFailure extends VerificationState {
  final String message;

  const AuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}


