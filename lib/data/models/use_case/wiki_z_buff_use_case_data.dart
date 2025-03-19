import 'package:planet_defender/domain/entities/zbuffs_type.dart';

class ZBuffUseCaseData {
  final List<String> zBuffIds;
  final Map<String, ZBuffsType> zBuffs;

  const ZBuffUseCaseData({
    this.zBuffIds = const [],
    this.zBuffs = const {},
  });
}
