import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planet_defender/domain/entities/spaceship.dart';

part 'wiki_spaceship_state.g.dart';

enum WikiSpaceshipStatus { init, start, success, error }

@JsonSerializable()
@CopyWith()
class WikiSpaceshipState extends Equatable {
  final WikiSpaceshipStatus status;
  final Map<String, Spaceship> spaceShips;
  final List<String> spaceShipIds;
  const WikiSpaceshipState(
      {this.spaceShips = const {},
      this.spaceShipIds = const [],
      this.status = WikiSpaceshipStatus.init});

  @override
  List<Object> get props => [status, spaceShipIds, spaceShips];
  factory WikiSpaceshipState.fromJson(Map<String, dynamic> json) =>
      _$WikiSpaceshipStateFromJson(json);
  Map<String, dynamic> toJson() => _$WikiSpaceshipStateToJson(this);
}
