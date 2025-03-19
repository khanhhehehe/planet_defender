import 'dart:async';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/domain/use_cases/login_usecase.dart';
import 'package:planet_defender/presentations/bloc/auth/auth_bloc.dart';
import 'package:planet_defender/presentations/bloc/login/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final AuthBloc _authBloc;

  LoginBloc()
      : _loginUseCase = dI<LoginUseCase>(),
        _authBloc = dI<AuthBloc>(),
        super(const LoginState()) {
    on<RequestLogin>(_requestLogin);
    on<ValidateLogin>(_validate);
    on<StatusLogin>(_status);
    on<PassLogin>(_passWordLogin);
    on<EmailOrUserLogin>(_emailOrUserNameLogin);
  }

  FutureOr<void> _requestLogin(
      RequestLogin event, Emitter<LoginState> emit) async {
    if (event.username.isEmpty && event.password.isEmpty) {
      emit(state.copyWith(
          username: event.username,
          password: event.password,
          status: LoginStatus.loginAccountRequired));
      return;
    } else {
      try {
        await _loginUseCase.login(
            username: event.username, password: event.password);
        _authBloc.add(const CheckAuthenticated());
        emit(state.copyWith(
            username: event.username,
            password: event.password,
            status: LoginStatus.loginSuccess));
      } catch (e) {
        emit(state.copyWith(
            username: event.username,
            password: event.password,
            status: LoginStatus.loginFailed));
      }
    }
  }

  FutureOr<void> _validate(
      ValidateLogin event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    if (event.username.isNotEmpty && event.password.isNotEmpty) {
      emit(state.copyWith(status: LoginStatus.validateSuccess));
    } else {
      if (event.password.isEmpty && event.username.isEmpty) {
        emit(state.copyWith(status: LoginStatus.validateFailed));
      } else if (event.username.isEmpty) {
        emit(state.copyWith(status: LoginStatus.emailOrUserFalse));
      } else {
        emit(state.copyWith(status: LoginStatus.passFalse));
      }
    }
  }

  FutureOr<void> _status(StatusLogin event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    if (event.status == 200) {
      emit(state.copyWith(status: LoginStatus.statusSuccess));
    } else {
      emit(state.copyWith(status: LoginStatus.statusFalse));
    }
  }

  FutureOr<void> _emailOrUserNameLogin(
      EmailOrUserLogin even, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    if (even.email.isNotEmpty) {
      emit(state.copyWith(status: LoginStatus.emailOrUserFalse));
    }
  }

  FutureOr<void> _passWordLogin(
      PassLogin even, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    if (even.password.isNotEmpty) {
      emit(state.copyWith(status: LoginStatus.passFalse));
    }
  }
}
