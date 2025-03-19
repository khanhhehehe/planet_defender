import 'package:planet_defender/data/models/use_case/spaceship_data.dart';

abstract class WikiSpaceshipUseCase {
  Future<SpaceshipUseCaseData> getSpaceships();
}
