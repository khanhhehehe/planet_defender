import 'dart:convert';

import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/path_config.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/common/storage/local_storage.dart';
import 'package:planet_defender/data/models/question_time_config_model.dart';
import 'package:planet_defender/data/models/questions_model.dart';
import 'package:planet_defender/data/models/request/answer_the_question_request.dart';
import 'package:planet_defender/data/models/response.dart';
import 'package:planet_defender/data/services/base.service.dart';
import 'package:planet_defender/domain/services/questions.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QuestionsService)
class QuestionsServiceImpl extends BaseService implements QuestionsService {
  late String baseUrl;

  QuestionsServiceImpl() : super() {
    baseUrl = appConfig.baseApiUrl;
  }

  @override
  Future<List<QuestionsModel>> getQuestions(
      {required String roundNumber}) async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.getQuestions}';
    final headers = {'Authorization': 'Bearer $token'};
    final params = {'RoundNumber': roundNumber};
    final response =
        await client.get(url, customHeaders: headers, params: params);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return (responseBase.result as List<dynamic>)
        .map((e) => QuestionsModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<QuestionTimeConfigsModel>> getGamePlayTimeConfig() async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.getListGamePlayTimeConfig}';
    final headers = {'Authorization': 'Bearer $token'};
    final response = await client.get(url, customHeaders: headers);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return (responseBase.result as List<dynamic>)
        .map((e) => QuestionTimeConfigsModel.fromJson(e))
        .toList();
  }

  @override
  Future<bool> answerTheQuestion(
      {required AnswerTheQuestionRequest request}) async {
    final token = await AppLocalStorage.getData(DataKey.token);
    final url = '$baseUrl${PathConfig.answerTheQuestion}';
    final headers = {'Authorization': 'Bearer $token'};
    final body = jsonEncode(request.toJson());
    final response = await client.post(url, body: body, customHeaders: headers);
    final responseBase = ResponseBase.fromJson(json.decode(response.body));
    return responseBase.result;
  }
}
