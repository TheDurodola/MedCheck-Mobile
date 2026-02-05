import 'package:equatable/equatable.dart';

abstract class VerificaitionEvent extends Equatable {
  const VerificaitionEvent();

  @override
  List<Object> get props => [];
}

class PackVerificationRequested extends VerificaitionEvent {
  final String username;
  final String password;

  const PackVerificationRequested({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}



