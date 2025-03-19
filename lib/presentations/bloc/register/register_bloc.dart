import 'dart:async';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/authentication_screen_type.dart';
import 'package:planet_defender/data/models/request/register_request.dart';
import 'package:planet_defender/data/models/request/update_register_request.dart';
import 'package:planet_defender/domain/use_cases/register_usecase.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/register/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

part 'register_event.dart';

@lazySingleton
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  final AuthScreensCubit _authScreensCubit;
  RegisterBloc()
      : _registerUseCase = dI<RegisterUseCase>(),
        _authScreensCubit = dI<AuthScreensCubit>(),
        super(const RegisterState()) {
    on<RequestRegister>(_requestRegister);
    on<ConfirmOtpRegister>(_confirmOtpRegister);
    on<InitRegister>(_initRegister);
    on<SetDateOfBirth>(_setDateOfBirth);
    on<SetGender>(_setGender);
    on<OnUpdateRegister>(_onUpdateRegister);
  }

  FutureOr<void> _initRegister(
      InitRegister event, Emitter<RegisterState> emit) {
    emit(state.copyWith(status: RegisterStatus.init));
  }

  FutureOr<void> _requestRegister(
      RequestRegister event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(registerRequest: event.request));
    emit(state.copyWith(status: RegisterStatus.init));
    try {
      await _registerUseCase.register(request: event.request);
      emit(state.copyWith(
          status: RegisterStatus.success,
          userName: event.request.email.isNotEmpty
              ? event.request.email
              : event.request.numberPhone,
          passWord: event.request.password));
      _authScreensCubit.changeStatus(AuthenticationScreensType.registerOtp);
    } catch (e) {
      emit(state.copyWith(status: RegisterStatus.failed));
    }
  }

  FutureOr<void> _confirmOtpRegister(
      ConfirmOtpRegister event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.init));
    try {
      final id = await _registerUseCase.confirmOtpRegister(
          code: event.code, email: state.registerRequest?.email ?? '');
      emit(state.copyWith(status: RegisterStatus.success));
      emit(state.copyWith(userId: id));
    } catch (e) {
      emit(state.copyWith(status: RegisterStatus.failed));
    }
  }

  FutureOr<void> _setDateOfBirth(
      SetDateOfBirth event, Emitter<RegisterState> emit) async {
    var inputFormat = DateFormat('dd/MM/yyyy');
    DateTime date = inputFormat.parse(event.date);
    String formatDate = DateFormat('yyyy-MM-dd').format(date);
    emit(state.copyWith(date: formatDate));
  }

  FutureOr<void> _setGender(
      SetGender event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(gender: event.gender));
  }

  FutureOr<void> _onUpdateRegister(
      OnUpdateRegister event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.init));
    try {
      await _registerUseCase.updateRegister(
          request: UpdateRegisterRequest(
              userId: state.userId,
              gender: state.gender,
              birthday: state.date));
      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: RegisterStatus.failed));
    }
  }
}
