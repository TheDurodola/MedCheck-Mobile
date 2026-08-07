import 'package:equatable/equatable.dart';

class VerificationParams extends Equatable {
  final String packVerificationCode;

  const VerificationParams(this.packVerificationCode);

  @override

  List<Object?> get props => [packVerificationCode];
}