import 'package:injectable/injectable.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/response/avatar_user_response.dart';
import 'package:planet_defender/data/models/response/game_history_response.dart';
import 'package:planet_defender/data/models/response/tag_user_response.dart';
import 'package:planet_defender/data/models/use_case/personal.dart';
import 'package:planet_defender/domain/entities/avatar_user.dart';
import 'package:planet_defender/domain/entities/game_history.dart';
import 'package:planet_defender/domain/entities/student_answers.dart';
import 'package:planet_defender/domain/entities/tag_user.dart';
import 'package:planet_defender/domain/repositories/personal.repository.dart';
import 'package:planet_defender/domain/use_cases/personal_info_usecase.dart';

@LazySingleton(as: PersonalInfoUseCase)
class PersonalUseCaseImp extends PersonalInfoUseCase {
  final PersonalInfoRepository _repository;
  PersonalUseCaseImp() : _repository = dI<PersonalInfoRepository>();

  @override
  Future<PersonalInfoUseCaseData> getStudentDetail(
      {required String studentId}) async {
    final data = await _repository.getStudentDetail(studentId: studentId);
    return PersonalInfoUseCaseData(
        avatarPath: data.avatarPath,
        characterOwned: data.characterOwned,
        currentRank: data.currentRank.toString(),
        exp: data.exp,
        level: data.level,
        name: data.name,
        spaceshipOwned: data.spaceshipOwned,
        totalExp: data.totalExp,
        totalGamePlay: data.totalGamePlay,
        fselCoin: data.fselCoin,
        accountType: data.accountType,
        code: data.code,
        battle: data.battle,
        destroyed: data.destroyed,
        combo: data.combo,
        playedTime: data.playedTime,
        season: data.season,
        totalScore: data.totalScore,
        zMatter: data.zMatter,
        gameLevel: data.gameLevel,
        spaceshipUsed: data.spaceshipUsed,
        historyIds: _getHistoryIds(data.gameHistory),
        gameHistory: _getGameHistories(data.gameHistory),
        tags: _getTagUsers(data.tags),
        tagIds: _getTagUserIds(data.tags),
        avatarIds: _getAvatarUserIds(data.avatars),
        avatars: _getAvatarUsers(data.avatars));
  }

  Map<String, GameHistory> _getGameHistories(List<GameHistoryResponse> list) {
    return {
      for (var element in list)
        element.id: GameHistory(
            comboNumber: element.comboNumber,
            destroyNumber: element.destroyNumber,
            impactNumber: element.impactNumber,
            numberOfToken: element.numberOfToken,
            id: element.id,
            createdUserId: element.createdUserId,
            updatedUserId: element.updatedUserId,
            createdFullName: element.createdFullName,
            updatedFullName: element.updatedFullName,
            createdDate: element.createdDate,
            updatedDate: element.updatedDate,
            score: element.score,
            roundNumber: element.roundNumber,
            spaceShipCode: element.spaceShipCode,
            studentAnswers: element.studentAnswers
                .map((e) => StudentAnswers(
                      type: e.type,
                      questionContent: e.questionContent,
                      key: e.key,
                      answer: e.answer,
                      isCorrect: e.isCorrect,
                    ))
                .toList(),
            totalScore: element.totalScore,
            zPlanetNumber: element.zPlanetNumber,
            spaceShipId: element.spaceShipId,
            studentGameInfoId: element.studentGameInfoId)
    };
  }

  List<String> _getHistoryIds(List<GameHistoryResponse> list) =>
      list.map((e) => e.id).toList();
  Map<String, AvatarUser> _getAvatarUsers(List<AvatarUserResponse> list) => {
        for (var element in list)
          element.id: AvatarUser(
            id: element.id,
            avatar: element.avatar,
            isLock: element.isLock,
          )
      };
  List<String> _getAvatarUserIds(List<AvatarUserResponse> list) =>
      list.map((e) => e.id).toList();
  List<String> _getTagUserIds(List<TagUserResponse> list) =>
      list.map((e) => e.id).toList();

  Map<String, TagUser> _getTagUsers(List<TagUserResponse> list) => {
        for (var element in list)
          element.id: TagUser(
              id: element.id, isLock: element.isLock, title: element.title)
      };
}
