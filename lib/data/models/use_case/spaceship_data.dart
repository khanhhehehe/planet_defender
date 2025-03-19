import 'package:planet_defender/domain/entities/spaceship.dart';

class SpaceshipUseCaseData {
  final List<String> spaceShipIds;
  final Map<String, Spaceship> spaceShips;

  const SpaceshipUseCaseData({
    this.spaceShipIds = const [],
    this.spaceShips = const {},
  });
}
