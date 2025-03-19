import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_platform/universal_platform.dart';

enum DeviceFactorType { iPad, iPhone, androidPhone, androidTablet, other }

extension DeviceFactorTypeX on DeviceFactorType {
  bool get isAndroid =>
      (this == DeviceFactorType.androidPhone || DeviceScreen.hScreen < 740);
  bool get isiPhone =>
      (this == DeviceFactorType.iPhone && DeviceScreen.hScreen > 740);
  bool get isTab => this == DeviceFactorType.androidTablet;
  bool get isiPad => this == DeviceFactorType.iPad;
  bool get isOther => this == DeviceFactorType.other;
}

class DeviceOS {
  // Syntax sugar, proxy the UniversalPlatform methods so our views can reference a single class
  static bool isIOS = UniversalPlatform.isIOS;
  static bool isAndroid = UniversalPlatform.isAndroid;
}

class DeviceScreen {
  static double wScreen = 0.0;
  static double hScreen = 0.0;

  // Get the device form factor as best we can.
  // Otherwise we will use the screen size to determine which class we fall into.
  static DeviceFactorType checkDeviceType(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;

    wScreen = MediaQuery.of(context).size.width;
    hScreen = MediaQuery.of(context).size.height;
    if (kDebugMode) {
      print('hScreen: $hScreen');
    }

    // iphone 8plus: 736
    // ip 14promax : 932
    // iphone SE: 667

    if (DeviceOS.isIOS) {
      if (shortestSide <= 600) {
        typeScreenOS = DeviceFactorType.iPhone;
        return DeviceFactorType.iPhone;
      } else {
        typeScreenOS = DeviceFactorType.iPad;
        return DeviceFactorType.iPad;
      }
    } else if (DeviceOS.isAndroid) {
//      if (shortestSide <= 300) return DeviceFactorType.AndroidPhone;
      if (shortestSide <= 600) {
        typeScreenOS = DeviceFactorType.androidPhone;
        return DeviceFactorType.androidPhone;
      } else {
        typeScreenOS = DeviceFactorType.androidTablet;
        return DeviceFactorType.androidTablet;
      }
    } else {
      typeScreenOS = DeviceFactorType.other;
      return DeviceFactorType.other;
    }
  }

  // Shortcuts for various mobile device types
  static bool isAndroidPhone(BuildContext context) =>
      checkDeviceType(context) == DeviceFactorType.androidPhone;
  static bool isAndroidTablet(BuildContext context) =>
      checkDeviceType(context) == DeviceFactorType.androidTablet;

  static bool isIPhone(BuildContext context) =>
      checkDeviceType(context) == DeviceFactorType.iPhone;
  static bool isIPad(BuildContext context) =>
      checkDeviceType(context) == DeviceFactorType.iPad;

//  static int type_screen_os  = 4;// 0: android phone; 1 android tablet ; 2 iphone ; 3 ipad; 4 other
  static DeviceFactorType typeScreenOS = DeviceFactorType
      .other; // 0: android phone; 1 android tablet ; 2 iphone ; 3 ipad; 4 other
}
