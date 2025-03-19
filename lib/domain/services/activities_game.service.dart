import 'package:planet_defender/data/models/response/events_response.dart';

abstract class ActivitiesGameService {
  Future<List<EventsResponse>> getEvents();
}
