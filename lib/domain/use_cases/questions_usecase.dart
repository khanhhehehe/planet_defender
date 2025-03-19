import 'package:planet_defender/data/models/request/answer_the_question_request.dart';
import 'package:planet_defender/data/models/use_case/questions.dart';
import 'package:planet_defender/data/models/use_case/time_config_use_case_data.dart';

abstract class QuestionsUseCase {
  Future<QuestionUseCaseData> getQuestions({required String roundNumber});
  Future<TimeConfigUseCaseData> getGamePlayTimeConfig();
  Future<bool> answerTheQuestion({required AnswerTheQuestionRequest request});
}
