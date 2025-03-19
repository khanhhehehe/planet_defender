import 'dart:convert';

import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/path_config.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/data/models/request/game_history_request.dart';
import 'package:planet_defender/data/models/response.dart';
import 'package:planet_defender/data/models/response/game_history_response.dart';
import 'package:planet_defender/data/services/base.service.dart';
import 'package:planet_defender/domain/services/game_history.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GameHistoryService)
class GameHistoryServiceImpl extends BaseService implements GameHistoryService {
  late String baseUrl;

  GameHistoryServiceImpl() : super() {
    baseUrl = appConfig.baseApiUrl;
  }

  @override
  Future<String> saveGameHistory({
    required GameHistoryRequest gameHistoryRequest,
  }) async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.saveGameHistory}';
    final headers = {'Authorization': 'Bearer $token'};
    final body = jsonEncode(gameHistoryRequest.toJson());
    final response = await client.post(url, body: body, customHeaders: headers);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return responseBase.result["id"];
  }

  @override
  Future<GameHistoryResponse> getGameHistory(
      {required String gameHistoryId}) async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.getGameHistory}/$gameHistoryId';
    final headers = {'Authorization': 'Bearer $token'};
    final response = await client.get(url, customHeaders: headers);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return GameHistoryResponse.fromJson(responseBase.result);
  }
}
