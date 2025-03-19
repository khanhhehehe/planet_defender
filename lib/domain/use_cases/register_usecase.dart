import 'package:planet_defender/data/models/request/register_request.dart';
import 'package:planet_defender/data/models/request/update_register_request.dart';

abstract class RegisterUseCase {
  Future<void> register({required RegisterRequest request});
  Future<String> confirmOtpRegister(
      {required String code, required String email});
  Future<void> updateRegister({required UpdateRegisterRequest request});
}
