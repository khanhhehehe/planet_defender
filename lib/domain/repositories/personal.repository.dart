import 'package:planet_defender/data/models/response/personal_response.dart';

abstract class PersonalInfoRepository {
  Future<PersonalInfoResponse> getStudentDetail({required String studentId});
}
