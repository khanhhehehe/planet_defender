import 'package:json_annotation/json_annotation.dart';

part 'spaceships_type.g.dart';

@JsonSerializable()
class SpaceshipsType {
  final String id;
  final String name;
  final String image;
  final String content;
  final String hint;
  final bool isLock;

  const SpaceshipsType({
    this.id = '',
    this.name = '',
    this.image = '',
    this.content = '0',
    this.hint = '0',
    this.isLock = false,
  });

  factory SpaceshipsType.fromJson(Map<String, dynamic> json) =>
      _$SpaceshipsTypeFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceshipsTypeToJson(this);
}
