import 'dart:math';

import 'package:planet_defender/data/models/enums/z_buff_types.dart';

double currentX = 0;

class BuffUtils {
  ZBuffType randomBuff() {
    Random random = Random();
    int randomNumber = random.nextInt(ZBuffType.values.length);
    return ZBuffType.values[randomNumber];
  }
}
