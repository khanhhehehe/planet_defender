abstract class ForgotPasswordUseCase {
  Future<bool> forgotPassword({required String username});
  Future<bool> forgotPasswordConfirmOtp(
      {required String newPassword, required String otp});
}
