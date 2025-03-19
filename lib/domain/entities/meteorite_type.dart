import 'package:json_annotation/json_annotation.dart';

part 'meteorite_type.g.dart';

@JsonSerializable()
class MeteoriteType {
  final String id;
  final String name;
  final String image;
  final String content;
  final String hint;

  const MeteoriteType(
      {this.id = '',
      this.name = '',
      this.image = '',
      this.content = '0',
      this.hint = '0'});

  factory MeteoriteType.fromJson(Map<String, dynamic> json) => _$MeteoriteTypeFromJson(json);
  Map<String, dynamic> toJson() => _$MeteoriteTypeToJson(this);
}
