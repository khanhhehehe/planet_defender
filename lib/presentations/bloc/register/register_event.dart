part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

class RequestRegister extends RegisterEvent {
  final RegisterRequest request;
  const RequestRegister({
    required this.request,
  });

  @override
  List<Object> get props => [request];
}

class ConfirmOtpRegister extends RegisterEvent {
  final String code;
  const ConfirmOtpRegister({
    required this.code,
  });

  @override
  List<Object> get props => [code];
}

class InitRegister extends RegisterEvent {
  @override
  List<Object> get props => [];
}

class SetDateOfBirth extends RegisterEvent {
  final String date;
  const SetDateOfBirth({
    required this.date,
  });

  @override
  List<Object> get props => [date];
}

class SetGender extends RegisterEvent {
  final String gender;
  const SetGender({
    required this.gender,
  });

  @override
  List<Object> get props => [gender];
}

class OnUpdateRegister extends RegisterEvent {
  @override
  List<Object> get props => [];
}
