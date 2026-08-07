import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcheck/core/errors/failures.dart';
import 'package:medcheck/features/home/domain/usecases/verification_params.dart';
import 'package:medcheck/features/home/domain/usecases/verify_pack.dart';

import 'verification_event.dart';
import 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final VerifyPack verifyPack;
  VerificationBloc({required this.verifyPack}) : super(VerificationInitial()) {
    on<PackVerificationRequested>(_onPackVerificationRequest);
  }

  Future<void> _onPackVerificationRequest(
    PackVerificationRequested event,
    Emitter<VerificationState> emit,
  ) async {
    emit(VerificationLoading());

    final params = VerificationParams(event.packVerificationCode);

    final result = await verifyPack(params);

    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(VerificationFailure(message: failure.message));
      } else {
        (emit(VerificationFailure(message: failure.message)));
      }
    }, (pack) => emit(PackApproved(packEntity: pack)));
  }
}
