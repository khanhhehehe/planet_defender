import 'package:planet_defender/domain/entities/user.dart';

abstract class UserUseCase {
  Future<User> getUserInfo();
  Future<void> saveNickName({required String nickName, required String id});
  Future<void> saveAcademicLevel({required String level});
}
