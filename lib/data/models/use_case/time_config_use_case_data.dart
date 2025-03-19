import 'package:planet_defender/domain/entities/time_configs.dart';

class TimeConfigUseCaseData {
  final List<int> rounds;
  final Map<int, List<TimeConfig>> questionTimeConfigDetail;

  const TimeConfigUseCaseData({
    this.rounds = const [],
    this.questionTimeConfigDetail = const {},
  });
}
