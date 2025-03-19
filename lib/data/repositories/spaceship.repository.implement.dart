import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/spaceship_model.dart';
import 'package:planet_defender/domain/repositories/spaceship.reposity.dart';
import 'package:planet_defender/domain/services/spaceship.service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SpaceshipRepository)
class SpaceshipRepositoryImpl extends SpaceshipRepository {
  final SpaceshipService _service;

  SpaceshipRepositoryImpl() : _service = dI<SpaceshipService>();

  @override
  Future<List<SpaceshipModel>> getSpaceships() async {
    final spaceShips = await _service.getSpaceships();
    return spaceShips;
  }

  @override
  Future<void> buySpaceship({required String spaceShip}) async {
    await _service.buySpaceship(spaceShip: spaceShip);
  }
}
