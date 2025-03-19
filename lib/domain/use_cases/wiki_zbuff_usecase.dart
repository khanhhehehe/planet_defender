import 'package:planet_defender/data/models/use_case/wiki_z_buff_use_case_data.dart';

abstract class WikiZBuffUseCase {
  Future<ZBuffUseCaseData> getZBuff();
}
