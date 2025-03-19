import 'dart:convert';

import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/path_config.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/data/models/response.dart';
import 'package:planet_defender/data/models/wiki_z_buff_model.dart';
import 'package:planet_defender/data/services/base.service.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/domain/services/wiki_z_buff.service.dart';

@LazySingleton(as: WikiZBuffService)
class WikiZBuffServiceImpl extends BaseService implements WikiZBuffService {
  late String baseUrl;

  WikiZBuffServiceImpl() : super() {
    baseUrl = appConfig.baseApiUrl;
  }

  @override
  Future<List<WikiZBuffModel>> getZBuff() async {
    final url = '$baseUrl${PathConfig.getZBuff}';
    final token = await AppLocalStorage.getData(DataKey.token);
    final headers = {'Authorization': 'Bearer $token'};
    final response = await client.get(url, customHeaders: headers);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return (responseBase.result as List<dynamic>)
        .map((e) => WikiZBuffModel.fromJson(e))
        .toList();
  }
}
