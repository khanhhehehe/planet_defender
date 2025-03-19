import 'dart:convert';
import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/path_config.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/data/services/base.service.dart';
import 'package:planet_defender/domain/services/select_character_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SelectCharacterService)
class SelectCharacterServiceImpl extends BaseService
    implements SelectCharacterService {
  late String baseUrl;

  SelectCharacterServiceImpl() : super() {
    baseUrl = appConfig.baseApiUrl;
  }

  @override
  Future<void> selectCharacter(String gender) async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.chooseGender}';
    final headers = {'Authorization': 'Bearer $token'};
    final body = jsonEncode({"gender": gender});
    await client.post(url, body: body, customHeaders: headers);
  }

  @override
  Future<void> selectLevel(String level) async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.chooseLevel}';
    final body = jsonEncode({"level": level});
    final headers = {'Authorization': 'Bearer $token'};
    await client.put(url, body: body, customHeaders: headers);
  }
}
