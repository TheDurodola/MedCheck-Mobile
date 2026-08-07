import 'package:equatable/equatable.dart';
import 'package:medcheck/features/home/domain/entities/pack_entity.dart';


abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}

class PackApproved extends VerificationState {
  final PackEntity packEntity;


  const PackApproved({required this.packEntity});

  @override
  List<Object> get props => [packEntity];
}

class VerificationFailure extends VerificationState {
  final String message;

  const VerificationFailure({required this.message});

  @override
  List<Object> get props => [message];
}


