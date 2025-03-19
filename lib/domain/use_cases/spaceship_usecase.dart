import 'package:planet_defender/data/models/use_case/spaceship_data.dart';

abstract class SpaceshipUseCase {
  Future<SpaceshipUseCaseData> getSpaceships();
  Future<void> buySpaceship({required String spaceShip});
}
