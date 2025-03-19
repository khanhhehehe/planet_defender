import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'change_password_state.g.dart';

enum ChangePasswordStatus {
  init,
  success,
  failed,
}

@CopyWith()
class ChangePasswordState extends Equatable {
  final ChangePasswordStatus status;
  final String newPassword;
  final String currentPassword;
  final String confirmPassword;

  const ChangePasswordState({
    this.newPassword = "",
    this.currentPassword = '',
    this.confirmPassword = '',
    this.status = ChangePasswordStatus.init,
  });

  @override
  List<Object?> get props =>
      [status, newPassword, currentPassword, confirmPassword];
}
