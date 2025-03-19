import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/domain/repositories/auth.repository.dart';
import 'package:planet_defender/domain/use_cases/forgot_password_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ForgotPasswordUseCase)
class ForgotPasswordUseCaseImpl extends ForgotPasswordUseCase {
  final AuthRepository _authRepository;
  ForgotPasswordUseCaseImpl() : _authRepository = dI<AuthRepository>();

  @override
  Future<bool> forgotPassword({required String username}) async {
    return await _authRepository.forgotPassword(username);
  }

  @override
  Future<bool> forgotPasswordConfirmOtp(
      {required String newPassword, required String otp}) async {
    return await _authRepository.confirmOtpForgotPassword(
        otp: otp, newPassword: newPassword);
  }
}
