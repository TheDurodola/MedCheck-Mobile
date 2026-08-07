import 'package:equatable/equatable.dart';

abstract class VerificationEvent extends Equatable {
  const VerificationEvent();

  @override
  List<Object> get props => [];
}

class PackVerificationRequested extends VerificationEvent {
  final String packVerificationCode;


  const PackVerificationRequested({required this.packVerificationCode});

  @override
  List<Object> get props => [packVerificationCode];
}



