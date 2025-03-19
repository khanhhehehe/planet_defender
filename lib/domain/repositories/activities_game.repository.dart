
import 'package:planet_defender/data/models/response/events_response.dart';

abstract class ActivitiesGameRepository {
  Future<List<EventsResponse>> getEvents();
}
