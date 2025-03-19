import 'package:planet_defender/domain/entities/events_entity.dart';

class EventsUseCaseData {
  final List<String> eventIds;
  final Map<String, EventsEntity> events;

  const EventsUseCaseData({
    this.eventIds = const [],
    this.events = const {},
  });
}
