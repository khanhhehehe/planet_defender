import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/response/events_response.dart';
import 'package:planet_defender/domain/repositories/activities_game.repository.dart';
import 'package:planet_defender/domain/services/activities_game.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ActivitiesGameRepository)
class ActivitiesGameRepositoryImpl extends ActivitiesGameRepository {
  final ActivitiesGameService _service;

  ActivitiesGameRepositoryImpl() : _service = dI<ActivitiesGameService>();

  @override
  Future<List<EventsResponse>> getEvents() async {
    final events = await _service.getEvents();
    return events;
  }
}
