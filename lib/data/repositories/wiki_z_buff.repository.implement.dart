import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/wiki_z_buff_model.dart';
import 'package:planet_defender/domain/repositories/wiki_z_buff.repository.dart';
import 'package:injectable/injectable.dart';
import 'package:planet_defender/domain/services/wiki_z_buff.service.dart';

@LazySingleton(as: WikiZBuffRepository)
class WikiZBuffRepositoryImpl extends WikiZBuffRepository {
  final WikiZBuffService _service;

  WikiZBuffRepositoryImpl() : _service = dI<WikiZBuffService>();

  @override
  Future<List<WikiZBuffModel>> getZBuff() async {
    final listZBuff = await _service.getZBuff();
    return listZBuff;
  }
}
