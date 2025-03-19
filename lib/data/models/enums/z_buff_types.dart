import 'package:planet_defender/gen/assets.gen.dart';

enum ZBuffType {
  coin1('coin'),
  coin2('coin'),
  coin3('coin'),
  windBlade('Wind Blade'),
  stopWatch('Stop Watch'),
  gumBomp('Gum Bomp'),
  shield('Shield'),
  powerUp('Power up'),
  spaceNuke('Space nuke'),
  xRayCube('X-Ray Cube'),
  goldExtractor('gold Extractor'),
  deepSpaceFreeze('Deep Space Freeze'),
  unknown("Unknown");

  final String name;
  const ZBuffType(this.name);
}

extension ZBuffTypeEx on ZBuffType {
  String get pathImage {
    switch (this) {
      case ZBuffType.coin1:
        return Assets.images.coin1.path;
      case ZBuffType.coin2:
        return Assets.images.coin2.path;
      case ZBuffType.coin3:
        return Assets.images.coin3.path;
      case ZBuffType.windBlade:
        return Assets.images.windBlade.path;
      case ZBuffType.stopWatch:
        return Assets.images.stopwatch.path;
      case ZBuffType.gumBomp:
        return Assets.images.gumBomp.path;
      case ZBuffType.shield:
        return Assets.images.shield.path;
      case ZBuffType.powerUp:
        return Assets.images.powerUp.path;
      case ZBuffType.spaceNuke:
        return Assets.images.spaceNuke.path;
      case ZBuffType.xRayCube:
        return Assets.images.xRayCube.path;
      case ZBuffType.goldExtractor:
        return Assets.images.goldExtractor.path;
      case ZBuffType.deepSpaceFreeze:
        return Assets.images.deepSpaceFreeze.path;
      default:
        return '';
    }
  }
}
