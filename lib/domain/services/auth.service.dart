import 'package:planet_defender/data/models/request/login_request.dart';
import 'package:planet_defender/data/models/request/register_request.dart';
import 'package:planet_defender/data/models/request/update_register_request.dart';
import 'package:planet_defender/data/models/response/login_response.dart';
import 'package:planet_defender/data/models/response/register_response.dart';

abstract class AuthService {
  //login
  Future<LoginResponse> login(LoginRequest request);

  //register
  Future<RegisterResponse> register(RegisterRequest request);
  Future<RegisterOtpResponse> confirmOtpRegister(
      {required String code, required String email});
  Future<void> updateRegister(UpdateRegisterRequest request);

  //forgot password
  Future<bool> forgotPassword(String username);
  Future<bool> forgotPasswordConfirmOtp(
      {required String otp, required String newPassword});
}
