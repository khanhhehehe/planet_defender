import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/data/models/request/register_request.dart';
import 'package:planet_defender/data/models/request/update_register_request.dart';
import 'package:planet_defender/domain/repositories/auth.repository.dart';
import 'package:planet_defender/domain/use_cases/register_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RegisterUseCase)
class RegisterUseCaseImpl extends RegisterUseCase {
  final AuthRepository _authRepository;
  RegisterUseCaseImpl() : _authRepository = dI<AuthRepository>();

  @override
  Future<void> register({required RegisterRequest request}) async {
    await _authRepository.register(request);
  }

  @override
  Future<String> confirmOtpRegister(
      {required String code, required String email}) async {
    final response =
        await _authRepository.confirmOtpRegister(code: code, email: email);
    AppLocalStorage.saveData(DataKey.token, response.accessToken.toString());
    return response.userId.toString();
  }

  @override
  Future<void> updateRegister({required UpdateRegisterRequest request}) async {
    await _authRepository.updateRegister(request);
  }
}
