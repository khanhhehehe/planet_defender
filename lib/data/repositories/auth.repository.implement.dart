import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/constants/platform_code.dart';
import 'package:planet_defender/data/models/request/login_request.dart';
import 'package:planet_defender/data/models/request/register_request.dart';
import 'package:planet_defender/data/models/request/update_register_request.dart';
import 'package:planet_defender/data/models/response/register_response.dart';
import 'package:planet_defender/domain/repositories/auth.repository.dart';
import 'package:planet_defender/domain/services/auth.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;
  AuthRepositoryImpl() : _authService = dI<AuthService>();

  // login
  @override
  Future<String> login(String username, String password) async {
    final response = await _authService.login(LoginRequest(
        password: password,
        username: username,
        platformCode: PlatformCodeConst.platformCode));
    return response.accessToken;
  }

  // register
  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await _authService.register(request);
    return response;
  }

  @override
  Future<RegisterOtpResponse> confirmOtpRegister(
      {required String code, required String email}) async {
    final response =
        await _authService.confirmOtpRegister(code: code, email: email);
    return response;
  }

  @override
  Future<void> updateRegister(
      UpdateRegisterRequest updateRegisterRequest) async {
    await _authService.updateRegister(updateRegisterRequest);
  }

  // forgot password
  @override
  Future<bool> forgotPassword(String username) async {
    return await _authService.forgotPassword(username);
  }

  @override
  Future<bool> confirmOtpForgotPassword(
      {required String otp, required String newPassword}) async {
    final response = await _authService.forgotPasswordConfirmOtp(
        otp: otp, newPassword: newPassword);
    return response;
  }
}
