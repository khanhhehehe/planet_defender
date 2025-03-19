import 'package:injectable/injectable.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/use_case/wiki_z_buff_use_case_data.dart';
import 'package:planet_defender/data/models/wiki_z_buff_model.dart';
import 'package:planet_defender/domain/entities/zbuffs_type.dart';
import 'package:planet_defender/domain/repositories/wiki_z_buff.repository.dart';
import 'package:planet_defender/domain/use_cases/wiki_zbuff_usecase.dart';
import 'package:planet_defender/gen/assets.gen.dart';

@LazySingleton(as: WikiZBuffUseCase)
class WikiZBuffUseCaseImpl extends WikiZBuffUseCase {
  final WikiZBuffRepository _repository;
  WikiZBuffUseCaseImpl() : _repository = dI<WikiZBuffRepository>();
  @override
  Future<ZBuffUseCaseData> getZBuff() async {
    final data = await _repository.getZBuff();
    return ZBuffUseCaseData(
        zBuffIds: _getZBuffIds(data), zBuffs: _getZBuffs(data));
  }

  List<String> _getZBuffIds(List<WikiZBuffModel> list) {
    return list.map((e) => e.id).toList();
  }

  Map<String, ZBuffsType> _getZBuffs(List<WikiZBuffModel> list) {
    return {
      for (var element in list)
        element.id: ZBuffsType(
          code: element.code,
          description: element.description,
          filePath: zBuffImage(image: element.filePath),
          isActive: element.isActive,
          id: element.id,
          createdUserId: element.createdUserId,
          updatedUserId: element.updatedUserId,
          createdFullName: element.createdFullName,
          updatedFullName: element.updatedFullName,
          createdDate: element.createdDate,
          updatedDate: element.updatedDate,
          isOwned: element.isOwned,
          name: element.name,
          usage: element.usage,
        )
    };
  }

  String zBuffImage({required String image}) {
    return image == '' ? Assets.images.powerUp.path : image;
  }
}
