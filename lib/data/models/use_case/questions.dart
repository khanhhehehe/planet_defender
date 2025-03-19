import 'package:planet_defender/domain/entities/questions.dart';

class QuestionUseCaseData {
  final List<String> questionIds;
  final Map<String, Questions> questionDetails;

  const QuestionUseCaseData({
    this.questionIds = const [],
    this.questionDetails = const {},
  });
}
