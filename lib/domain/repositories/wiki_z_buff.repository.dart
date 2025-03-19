import 'package:planet_defender/data/models/wiki_z_buff_model.dart';

abstract class WikiZBuffRepository {
  Future<List<WikiZBuffModel>> getZBuff();
}
