import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/question_time_config_model.dart';
import 'package:planet_defender/data/models/questions_model.dart';
import 'package:planet_defender/data/models/request/answer_the_question_request.dart';
import 'package:planet_defender/domain/repositories/questions.repository.dart';
import 'package:planet_defender/domain/services/questions.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QuestionsRepository)
class QuestionsRepositoryImpl extends QuestionsRepository {
  final QuestionsService _service;

  QuestionsRepositoryImpl() : _service = dI<QuestionsService>();

  @override
  Future<List<QuestionsModel>> getQuestions(
      {required String roundNumber}) async {
    final listQuestion = await _service.getQuestions(roundNumber: roundNumber);
    return listQuestion;
  }

  @override
  Future<List<QuestionTimeConfigsModel>> getGamePlayTimeConfig() async {
    return await _service.getGamePlayTimeConfig();
  }

  @override
  Future<bool> answerTheQuestion(
      {required AnswerTheQuestionRequest request}) async {
    return await _service.answerTheQuestion(request: request);
  }
}
