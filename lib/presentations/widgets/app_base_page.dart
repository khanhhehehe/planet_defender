import 'package:planet_defender/presentations/themes/themes.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget? child;
  final AppBar? appBar;
  const BasePage({super.key, this.child, this.appBar});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.getColors(context);
    return Scaffold(
      backgroundColor: colors.background,
      appBar: appBar,
      body: child,
    );
  }
}
