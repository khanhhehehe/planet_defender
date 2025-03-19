import 'package:planet_defender/data/models/use_case/events_usecase_data.dart';

abstract class ActivitiesGameUseCase {
  Future<EventsUseCaseData> getEvents();
}
