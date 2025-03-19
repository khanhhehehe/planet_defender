import 'package:planet_defender/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUserInfo();
  Future<void> saveNickName({required String nickName, required String id});
  Future<void> saveAcademicLevel({required String level});
}
