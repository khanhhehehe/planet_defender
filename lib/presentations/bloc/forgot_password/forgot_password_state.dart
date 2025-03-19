import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.g.dart';

enum ForgotPasswordStatus {
  init,
  success,
  failed,
}

@CopyWith()
class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus status;
  final String newPassword;

  const ForgotPasswordState({
    this.newPassword = "",
    this.status = ForgotPasswordStatus.init,
  });

  @override
  List<Object?> get props => [status, newPassword];
}
