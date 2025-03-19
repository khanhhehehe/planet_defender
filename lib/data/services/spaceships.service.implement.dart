import 'dart:convert';

import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/path_config.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/data/models/response.dart';
import 'package:planet_defender/data/models/spaceship_model.dart';
import 'package:planet_defender/data/services/base.service.dart';
import 'package:planet_defender/domain/services/spaceship.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SpaceshipService)
class SpaceshipServiceImpl extends BaseService implements SpaceshipService {
  late String baseUrl;

  SpaceshipServiceImpl() : super() {
    baseUrl = appConfig.baseApiUrl;
  }

  @override
  Future<List<SpaceshipModel>> getSpaceships() async {
    final url = '$baseUrl${PathConfig.getSpaceships}';
    final token = await AppLocalStorage.getData(DataKey.token);
    final headers = {'Authorization': 'Bearer $token'};
    final response = await client.get(url, customHeaders: headers);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return (responseBase.result as List<dynamic>)
        .map((e) => SpaceshipModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> buySpaceship({required String spaceShip}) async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.buySpaceship}';
    final headers = {'Authorization': 'Bearer $token'};
    final body = jsonEncode({"spaceShip": spaceShip});
    await client.post(url, body: body, customHeaders: headers);
  }
}
