import 'dart:convert';

import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/path_config.dart';
import 'package:planet_defender/data/models/request/login_request.dart';
import 'package:planet_defender/data/models/request/register_request.dart';
import 'package:planet_defender/data/models/request/update_register_request.dart';
import 'package:planet_defender/data/models/response.dart';
import 'package:planet_defender/data/models/response/login_response.dart';
import 'package:planet_defender/data/models/response/register_response.dart';
import 'package:planet_defender/data/services/base.service.dart';
import 'package:planet_defender/domain/services/auth.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthService)
class AuthServiceImpl extends BaseService implements AuthService {
  late String baseUrl;

  AuthServiceImpl() : super() {
    baseUrl = appConfig.baseApiUrl;
  }
  @override
  Future<bool> forgotPassword(String username) async {
    final url = '$baseUrl${PathConfig.forgotPassword}';
    final body = jsonEncode({'email': username});
    final response = await client.post(url, body: body);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return responseBase.result as bool;
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final url = '$baseUrl${PathConfig.login}';
    final body = jsonEncode(request.toJson());
    final response = await client.post(url, body: body);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return LoginResponse.fromJson(responseBase.result);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    final url = '$baseUrl${PathConfig.register}';
    final body = jsonEncode(request.toJson());
    final response = await client.post(url, body: body);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return RegisterResponse.fromJson(responseBase.result);
  }

  @override
  Future<RegisterOtpResponse> confirmOtpRegister(
      {required String code, required String email}) async {
    final url = '$baseUrl${PathConfig.confirmOtpRegister}';
    final body = jsonEncode({"otp": code, "email": email});
    final response = await client.post(url, body: body);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return RegisterOtpResponse.fromJson(responseBase.result);
  }

  @override
  Future<void> updateRegister(UpdateRegisterRequest request) async {
    final url = '$baseUrl${PathConfig.updateRegister}';
    final body = jsonEncode(request.toJson());
    await client.put(url, body: body);
  }

  @override
  Future<bool> forgotPasswordConfirmOtp(
      {required String otp, required String newPassword}) async {
    final url = '$baseUrl${PathConfig.confirmOtpForgotPassword}';
    final body = jsonEncode({"otp": otp, "newPassword": newPassword});
    final response = await client.post(url, body: body);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return responseBase.result as bool;
  }
}
