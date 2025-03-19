import 'package:planet_defender/data/models/spaceship_model.dart';

abstract class SpaceshipService {
  Future<List<SpaceshipModel>> getSpaceships();
  Future<void> buySpaceship({required String spaceShip});
}
