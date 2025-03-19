import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/domain/entities/spaceship.dart';

part 'spaceships_state.g.dart';

enum SpaceshipsStatus {
  init,
  start,
  success,
  error,
}

@JsonSerializable()
@CopyWith()
class SpaceshipsState extends Equatable {
  final SpaceshipsStatus status;
  final Map<String, Spaceship> spaceShips;
  final List<String> spaceShipIds;
  const SpaceshipsState(
      {this.status = SpaceshipsStatus.init,
      this.spaceShips = const {},
      this.spaceShipIds = const []});

  @override
  List<Object> get props => [status, spaceShips, spaceShipIds];
  factory SpaceshipsState.fromJson(Map<String, dynamic> json) =>
      _$SpaceshipsStateFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceshipsStateToJson(this);
}
