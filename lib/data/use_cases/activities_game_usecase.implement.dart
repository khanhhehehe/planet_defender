import 'package:injectable/injectable.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/response/events_response.dart';
import 'package:planet_defender/data/models/use_case/events_usecase_data.dart';
import 'package:planet_defender/domain/entities/events_entity.dart';
import 'package:planet_defender/domain/repositories/activities_game.repository.dart';
import 'package:planet_defender/domain/use_cases/activities_game.usecase.dart';

@LazySingleton(as: ActivitiesGameUseCase)
class ActivitiesGameUseCaseImpl extends ActivitiesGameUseCase {
  final ActivitiesGameRepository _repository;
  ActivitiesGameUseCaseImpl() : _repository = dI<ActivitiesGameRepository>();

  @override
  Future<EventsUseCaseData> getEvents() async {
    final data = await _repository.getEvents();
    return EventsUseCaseData(
        eventIds: _getEventIds(data), events: _getEvents(data));
  }

  List<String> _getEventIds(List<EventsResponse> list) {
    return list.map((e) => e.id).toList();
  }

  Map<String, EventsEntity> _getEvents(List<EventsResponse> list) {
    return {
      for (var element in list)
        element.id: EventsEntity(
          id: element.id,
          createdUserId: element.createdUserId,
          updatedUserId: element.updatedUserId,
          createdFullName: element.createdFullName,
          updatedFullName: element.updatedFullName,
          createdDate: element.createdDate,
          updatedDate: element.updatedDate,
          description: element.description,
          filePath: element.filePath,
          startDate: element.startDate,
          status: element.status,
          title: element.title,
          type: element.type,
        )
    };
  }
}
