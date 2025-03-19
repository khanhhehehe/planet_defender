import 'package:flutter/material.dart';

enum Logo { google, facebook, apple, account }

class ScreenAuthModel {
  final Widget widget;
  final String titleScreen;
  final String pathImageHeaderName;
  final String pathImageBackgroundName;
  final String imageIcon;
  final String titleBottomLayout;
  final int bottomLoginLayout;
  final List<String> buttonIcons;

  ScreenAuthModel(
      {required this.widget,
      this.pathImageHeaderName = '',
      this.pathImageBackgroundName = '',
      this.imageIcon = '',
      this.titleBottomLayout = '',
      this.bottomLoginLayout = 0,
      this.buttonIcons = const [],
      this.titleScreen = ''});
}
