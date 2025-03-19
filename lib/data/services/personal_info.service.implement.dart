import 'dart:convert';

import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/path_config.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/data/models/response.dart';
import 'package:planet_defender/data/models/response/personal_response.dart';
import 'package:planet_defender/data/services/base.service.dart';
import 'package:planet_defender/domain/services/personal.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PersonalService)
class PersonalInfoServiceImp extends BaseService implements PersonalService {
  late String baseUrl;

  PersonalInfoServiceImp() : super() {
    baseUrl = appConfig.baseApiUrl;
  }
  @override
  Future<PersonalInfoResponse> getStudentDetail(
      {required String studentId}) async {
    final url = '$baseUrl${PathConfig.getStudentDetail}/$studentId';
    final token = await AppLocalStorage.getData(DataKey.token);
    final headers = {'Authorization': 'Bearer $token'};
    final response = await client.get(url, customHeaders: headers);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return PersonalInfoResponse.fromJson(responseBase.result);
  }
}
