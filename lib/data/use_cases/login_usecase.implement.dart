import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/domain/repositories/auth.repository.dart';
import 'package:planet_defender/domain/use_cases/login_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoginUseCase)
class LoginUseCaseImpl extends LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCaseImpl() : _authRepository = dI<AuthRepository>();
  @override
  Future<String> login(
      {required String username, required String password}) async {
    final token = await _authRepository.login(username, password);
    AppConfig.setToken(token);
    AppLocalStorage.saveData(DataKey.token, token);
    return token;
  }
}
