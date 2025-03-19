import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/domain/entities/meteorite.dart';

part 'meteorite_detail.g.dart';

@JsonSerializable()
class ItemMeteorite {
  final String id;
  final List<Meteorite> listQuestion;
  final bool isEnable;

  const ItemMeteorite({
    this.id = '',
    this.isEnable = false,
    this.listQuestion = const [],
  });

  factory ItemMeteorite.fromJson(Map<String, dynamic> json) =>
      _$ItemMeteoriteFromJson(json);
  Map<String, dynamic> toJson() => _$ItemMeteoriteToJson(this);
}
