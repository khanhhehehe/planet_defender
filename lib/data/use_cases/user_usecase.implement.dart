import 'package:injectable/injectable.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/user_model.dart';
import 'package:planet_defender/domain/entities/user.dart';
import 'package:planet_defender/domain/repositories/user.repositories.dart';
import 'package:planet_defender/domain/use_cases/user_usecase.dart';

@LazySingleton(as: UserUseCase)
class UserUseCaseImpl extends UserUseCase {
  final UserRepository _repository;
  UserUseCaseImpl() : _repository = dI<UserRepository>();
  @override
  Future<User> getUserInfo() async {
    UserModel userModel = await _repository.getUserInfo();
    return User(
      courseLevel: userModel.courseLevel,
      studentId: userModel.studentId,
      nickName: userModel.nickName,
      gender: userModel.gender,
      level: userModel.level,
      avatarImageId: userModel.avatarImageId,
      tagNameId: userModel.tagNameId,
      tagName: userModel.tagName,
      highestRoundNumber: userModel.highestRoundNumber,
      highestScore: userModel.highestScore,
      id: userModel.id,
      createdUserId: userModel.createdUserId,
      updatedUserId: userModel.updatedUserId,
      createdFullName: userModel.createdFullName,
      updatedFullName: userModel.updatedFullName,
      createdDate: userModel.createdDate,
      updatedDate: userModel.updatedDate,
    );
  }

  @override
  Future<void> saveNickName(
      {required String nickName, required String id}) async {
    await _repository.saveNickName(nickName: nickName, id: id);
  }

  @override
  Future<void> saveAcademicLevel({required String level}) async {
    await _repository.saveAcademicLevel(level: level);
  }
}
