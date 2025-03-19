import 'dart:convert';

import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/path_config.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/data/models/character_model.dart';
import 'package:planet_defender/data/models/response.dart';
import 'package:planet_defender/data/services/base.service.dart';
import 'package:planet_defender/domain/services/character.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CharacterService)
class CharacterServiceImpl extends BaseService implements CharacterService {
  late String baseUrl;

  CharacterServiceImpl() : super() {
    baseUrl = appConfig.baseApiUrl;
  }

  @override
  Future<List<CharacterModel>> getCharacters() async {
    final url = '$baseUrl${PathConfig.getCharacters}';
    final token = await AppLocalStorage.getData(DataKey.token);
    final headers = {'Authorization': 'Bearer $token'};
    final response = await client.get(url, customHeaders: headers);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return (responseBase.result as List<dynamic>)
        .map((e) => CharacterModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> buyCharacter({required String characterId}) async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.buyCharacter}';
    final headers = {'Authorization': 'Bearer $token'};
    final body = jsonEncode({"characterId": characterId});
    await client.post(url, body: body, customHeaders: headers);
  }
}
