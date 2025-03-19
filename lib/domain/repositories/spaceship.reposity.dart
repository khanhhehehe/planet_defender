import 'package:planet_defender/data/models/spaceship_model.dart';

abstract class SpaceshipRepository {
  Future<List<SpaceshipModel>> getSpaceships();
  Future<void> buySpaceship({required String spaceShip});
}
