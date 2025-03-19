import 'package:injectable/injectable.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/request/game_history_request.dart';
import 'package:planet_defender/data/models/response/game_history_response.dart';
import 'package:planet_defender/domain/entities/game_history.dart';
import 'package:planet_defender/domain/entities/student_answers.dart';
import 'package:planet_defender/domain/repositories/game_history.dart';
import 'package:planet_defender/domain/use_cases/game_history_usecase.dart';

@LazySingleton(as: GameHistoryUseCase)
class GameHistoryUseCaseImpl extends GameHistoryUseCase {
  final GameHistoryRepository _repository;
  GameHistoryUseCaseImpl() : _repository = dI<GameHistoryRepository>();

  @override
  Future<String> saveGameHistory({required GameHistoryRequest request}) async {
    return await _repository.saveGameHistory(gameHistoryRequest: request);
  }

  @override
  Future<GameHistory> getGameHistory({required String gameHistoryId}) async {
    GameHistoryResponse data =
        await _repository.getGameHistory(gameHistoryId: gameHistoryId);
    return GameHistory(
      roundNumber: data.roundNumber,
      score: data.score,
      spaceShipId: data.spaceShipId,
      studentGameInfoId: data.studentGameInfoId,
      spaceShipCode: data.spaceShipCode,
      numberOfToken: data.numberOfToken,
      impactNumber: data.impactNumber,
      destroyNumber: data.destroyNumber,
      comboNumber: data.comboNumber,
      zPlanetNumber: data.zPlanetNumber,
      totalScore: data.totalScore,
      studentAnswers: data.studentAnswers
          .map((e) => StudentAnswers(
                type: e.type,
                questionContent: e.questionContent,
                key: e.key,
                answer: e.answer,
                isCorrect: e.isCorrect,
              ))
          .toList(),
      id: data.id,
      createdUserId: data.createdUserId,
      updatedUserId: data.updatedUserId,
      createdFullName: data.createdFullName,
      updatedFullName: data.updatedFullName,
      createdDate: data.createdDate,
      updatedDate: data.updatedDate,
      coin: data.coin,
    );
  }
}
