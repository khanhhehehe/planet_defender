import 'dart:convert';

import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/path_config.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/data/models/response.dart';
import 'package:planet_defender/data/models/user_model.dart';
import 'package:planet_defender/data/services/base.service.dart';
import 'package:planet_defender/domain/services/user.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserService)
class UserServiceImpl extends BaseService implements UserService {
  late String baseUrl;

  UserServiceImpl() : super() {
    baseUrl = appConfig.baseApiUrl;
  }

  @override
  Future<UserModel> getUserInfo() async {
    final url = '$baseUrl${PathConfig.getUser}';
    final token = await AppLocalStorage.getData(DataKey.token);
    final headers = {'Authorization': 'Bearer $token'};
    final response = await client.get(url, customHeaders: headers);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return UserModel.fromJson(responseBase.result);
  }

  @override
  Future<void> saveNickName(
      {required String nickName, required String id}) async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.createNickName}';
    final headers = {'Authorization': 'Bearer $token'};
    final body = jsonEncode({"nickName": nickName, "studentId": id});
    await client.post(url, body: body, customHeaders: headers);
  }

  @override
  Future<void> saveAcademicLevel({required String level}) async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.saveAcademicLevel}';
    final headers = {'Authorization': 'Bearer $token'};
    final body = jsonEncode({"level": level});
    await client.put(url, body: body, customHeaders: headers);
  }
}
