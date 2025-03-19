import 'dart:convert';

import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/path_config.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/data/models/response.dart';
import 'package:planet_defender/data/models/response/events_response.dart';
import 'package:planet_defender/data/services/base.service.dart';
import 'package:planet_defender/domain/services/activities_game.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ActivitiesGameService)
class ActivitiesGameServiceImpl extends BaseService
    implements ActivitiesGameService {
  late String baseUrl;

  ActivitiesGameServiceImpl() : super() {
    baseUrl = appConfig.baseApiUrl;
  }

  @override
  Future<List<EventsResponse>> getEvents() async {
    final url = '$baseUrl${PathConfig.getEvents}';
    final token = await AppLocalStorage.getData(DataKey.token);
    final headers = {'Authorization': 'Bearer $token'};
    final response = await client.get(url, customHeaders: headers);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return (responseBase.result as List<dynamic>)
        .map((e) => EventsResponse.fromJson(e))
        .toList();
  }
}
