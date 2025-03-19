import 'package:planet_defender/data/models/use_case/personal.dart';

abstract class PersonalInfoUseCase {
  Future<PersonalInfoUseCaseData> getStudentDetail({required String studentId});
}
