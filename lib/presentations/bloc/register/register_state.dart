import 'package:planet_defender/data/models/request/register_request.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'register_state.g.dart';

enum RegisterStatus {
  init,
  success,
  failed,
}

@CopyWith()
class RegisterState extends Equatable {
  final RegisterRequest? registerRequest;
  final RegisterStatus status;
  final String userId;
  final String date;
  final String userName;
  final String passWord;
  final String gender;

  const RegisterState({
    this.userName = '',
    this.passWord = '',
    this.userId = '',
    this.status = RegisterStatus.init,
    this.gender = '',
    this.date = '',
    this.registerRequest = const RegisterRequest(),
  });

  @override
  List<Object?> get props =>
      [registerRequest, status, userId, gender, date, userName, passWord];
}
