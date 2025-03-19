import 'package:planet_defender/data/models/question_time_config_model.dart';
import 'package:planet_defender/data/models/questions_model.dart';
import 'package:planet_defender/data/models/request/answer_the_question_request.dart';

abstract class QuestionsService {
  Future<List<QuestionsModel>> getQuestions({required String roundNumber});
  Future<List<QuestionTimeConfigsModel>> getGamePlayTimeConfig();
  Future<bool> answerTheQuestion({required AnswerTheQuestionRequest request});
}
