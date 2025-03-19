import 'package:injectable/injectable.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/spaceship_model.dart';
import 'package:planet_defender/data/models/use_case/spaceship_data.dart';
import 'package:planet_defender/domain/entities/spaceship.dart';
import 'package:planet_defender/domain/repositories/spaceship.reposity.dart';
import 'package:planet_defender/domain/use_cases/spaceship_usecase.dart';
import 'package:planet_defender/gen/assets.gen.dart';

@LazySingleton(as: SpaceshipUseCase)
class SpaceshipUseCaseImpl extends SpaceshipUseCase {
  final SpaceshipRepository _repository;
  SpaceshipUseCaseImpl() : _repository = dI<SpaceshipRepository>();
  @override
  Future<SpaceshipUseCaseData> getSpaceships() async {
    final spaceships = await _repository.getSpaceships();
    return SpaceshipUseCaseData(
        spaceShips: _getSpaceships(spaceships),
        spaceShipIds: _getSpaceshipIds(spaceships));
  }

  Map<String, Spaceship> _getSpaceships(List<SpaceshipModel> list) {
    Map<String, Spaceship> spaceshipMap = {};

    for (var element in list) {
      if (!element.isOwned) {
        spaceshipMap[element.id] = Spaceship(
          id: element.id,
          code: element.code,
          createdDate: element.createdDate,
          createdFullName: element.createdFullName,
          createdUserId: element.createdUserId,
          description: element.description,
          image: spaceShipImage(image: element.image),
          isDefault: element.isDefault,
          isOwned: element.isOwned,
          name: element.name,
          price: element.price,
          updatedDate: element.updatedDate,
          updatedFullName: element.updatedFullName,
          updatedUserId: element.updatedUserId,
        );
      }
    }

    return spaceshipMap;
  }

  List<String> _getSpaceshipIds(List<SpaceshipModel> list) {
    List<String> spaceShipIds = List.empty(growable: true);
    for (var element in list) {
      if (!element.isOwned) {
        spaceShipIds.add(element.id);
      }
    }
    return spaceShipIds;
  }

  @override
  Future<void> buySpaceship({required String spaceShip}) async {
    await _repository.buySpaceship(spaceShip: spaceShip);
  }

  String spaceShipImage({required String image}) {
    return image == '' ? Assets.images.spaceship2GamePlay.path : image;
  }
}
