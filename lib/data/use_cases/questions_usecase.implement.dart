import 'package:injectable/injectable.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/question_time_config_model.dart';
import 'package:planet_defender/data/models/questions_model.dart';
import 'package:planet_defender/data/models/request/answer_the_question_request.dart';
import 'package:planet_defender/data/models/use_case/questions.dart';
import 'package:planet_defender/data/models/use_case/time_config_use_case_data.dart';
import 'package:planet_defender/domain/entities/questions.dart';
import 'package:planet_defender/domain/entities/time_configs.dart';
import 'package:planet_defender/domain/repositories/questions.repository.dart';
import 'package:planet_defender/domain/use_cases/questions_usecase.dart';

@LazySingleton(as: QuestionsUseCase)
class QuestionUseCaseImpl extends QuestionsUseCase {
  final QuestionsRepository _repository;
  QuestionUseCaseImpl() : _repository = dI<QuestionsRepository>();

  @override
  Future<QuestionUseCaseData> getQuestions(
      {required String roundNumber}) async {
    final data = await _repository.getQuestions(roundNumber: roundNumber);
    return QuestionUseCaseData(
        questionIds: _getQuestionIds(data),
        questionDetails: _getQuestionDetails(data));
  }

  @override
  Future<TimeConfigUseCaseData> getGamePlayTimeConfig() async {
    final data = await _repository.getGamePlayTimeConfig();
    return TimeConfigUseCaseData(
      rounds: _getListRounds(data),
      questionTimeConfigDetail: _getQuestionTimeConfigDetail(data),
    );
  }

  @override
  Future<bool> answerTheQuestion(
      {required AnswerTheQuestionRequest request}) async {
    return await _repository.answerTheQuestion(request: request);
  }

// get game play time config
  List<int> _getListRounds(List<QuestionTimeConfigsModel> list) {
    return list.map((e) => e.roundNumber).toList();
  }

  Map<int, List<TimeConfig>> _getQuestionTimeConfigDetail(
      List<QuestionTimeConfigsModel> list) {
    return {
      for (var element in list)
        element.roundNumber: element.gameplayTimeConfigs
            .map((e) => TimeConfig(
                  id: e.id,
                  roundNumber: e.roundNumber,
                  gameVocabPDType: e.gameVocabPDType,
                  time: e.time,
                  percent: e.percent,
                ))
            .toList(),
    };
  }

// get questions
  List<String> _getQuestionIds(List<QuestionsModel> list) {
    return list.map((e) => e.id).toList();
  }

  Map<String, Questions> _getQuestionDetails(List<QuestionsModel> list) {
    return {
      for (var element in list)
        element.id: Questions(
          gameVocabType: element.gameVocabType,
          questionContent: element.questionContent,
          alternateSpelling: element.alternateSpelling,
          gameVocabularyId: element.gameVocabularyId,
          id: element.id,
          createdUserId: element.createdUserId,
          updatedUserId: element.updatedUserId,
          createdFullName: element.createdFullName,
          updatedFullName: element.updatedFullName,
          createdDate: element.createdDate,
          updatedDate: element.updatedDate,
        )
    };
  }
}
