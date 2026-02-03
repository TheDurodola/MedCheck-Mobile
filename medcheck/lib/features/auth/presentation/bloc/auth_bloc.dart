import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcheck/features/auth/domain/usecases/sign_up_customer.dart'
    hide LoginParams;
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/sign_up_params.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final SignUpCustomer signUpCustomer;

  AuthBloc({required this.loginUser, required this.signUpCustomer})
    : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<RegistrationRequested>(_registrationRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final params = LoginParams(
      username: event.username,
      password: event.password,
    );

    final result = await loginUser(params);

    result.fold((failure) {
      if (failure is InvalidRoleFailure) {
        emit(AuthInvalidRoleFailure(message: failure.message));
      } else if (failure is ServerFailure) {
        emit(AuthFailure(message: failure.message));
      } else {
        emit(AuthFailure(message: failure.message));
      }
    }, (user) => emit(AuthAuthenticated(user: user)));
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInitial());
  }

  Future<void> _registrationRequested(
    RegistrationRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final params = SignUpParams(
      username: event.username,
      password: event.password,
      firstName: event.firstName,
      lastName: event.lastName,
      middleName: event.middleName,
      email: event.email,
      phoneNumber: event.phoneNumber,
      nationalIdentityNumber: event.nationalIdentityNumber,
      gender: event.gender,
    );

    final result = await signUpCustomer(params);
  }
}
