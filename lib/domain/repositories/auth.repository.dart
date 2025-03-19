import 'package:planet_defender/data/models/request/register_request.dart';
import 'package:planet_defender/data/models/request/update_register_request.dart';
import 'package:planet_defender/data/models/response/register_response.dart';

abstract class AuthRepository {
  //login
  Future<String> login(String username, String password);

  // register
  Future<void> register(RegisterRequest request);
  Future<RegisterOtpResponse> confirmOtpRegister(
      {required String code, required String email});
  Future<void> updateRegister(UpdateRegisterRequest updateRegisterRequest);

  // forgot password
  Future<bool> forgotPassword(String username);
  Future<bool> confirmOtpForgotPassword(
      {required String otp, required String newPassword});
}
