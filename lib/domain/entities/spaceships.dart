// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/domain/entities/spaceship.dart';

part 'spaceships.g.dart';

@JsonSerializable()
class Spaceships {
  List<Spaceship> items;
  Spaceships({
    this.items = const [],
  });

  factory Spaceships.fromJson(Map<String, dynamic> json) =>
      _$SpaceshipsFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceshipsToJson(this);
}
