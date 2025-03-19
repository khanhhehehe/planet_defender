import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/response/personal_response.dart';
import 'package:planet_defender/domain/repositories/personal.repository.dart';
import 'package:planet_defender/domain/services/personal.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PersonalInfoRepository)
class PersonalInfoRepositoryImpl extends PersonalInfoRepository {
  final PersonalService _service;

  PersonalInfoRepositoryImpl() : _service = dI<PersonalService>();

  @override
  Future<PersonalInfoResponse> getStudentDetail(
      {required String studentId}) async {
    final personalInfo = await _service.getStudentDetail(studentId: studentId);
    return personalInfo;
  }
}
