import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/user_model.dart';
import 'package:planet_defender/domain/repositories/user.repositories.dart';
import 'package:planet_defender/domain/services/user.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserService _service;

  UserRepositoryImpl() : _service = dI<UserService>();

  @override
  Future<UserModel> getUserInfo() async {
    UserModel user = await _service.getUserInfo();
    return user;
  }

  @override
  Future<void> saveNickName(
      {required String nickName, required String id}) async {
    await _service.saveNickName(
      nickName: nickName,
      id: id,
    );
  }

  @override
  Future<void> saveAcademicLevel({required String level}) async {
    await _service.saveAcademicLevel(level: level);
  }
}
