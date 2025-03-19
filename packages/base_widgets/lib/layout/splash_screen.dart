import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class LayoutGameFselSplashScreen extends StatelessWidget {
  final String textButton;
  final bool isVisible;
  final String pathImageBackground;
  final String pathImageLogo;
  final String pathTextLogo;
  final VoidCallback? onPress;
  const LayoutGameFselSplashScreen(
      {super.key,
      this.textButton = 'title button',
      this.isVisible = false,
      this.pathImageBackground = 'path',
      this.pathImageLogo = 'path',
      this.pathTextLogo = 'path',
      this.onPress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(pathImageBackground), fit: BoxFit.fill)),
      child: SafeArea(
        child: Stack(children: [
          SizedBox(
            width: double.infinity,
            child: Column(children: [
              const SizedBox(
                height: SpacingUnit.x13,
              ),
              Image.asset(pathImageLogo),
              const SizedBox(
                height: SpacingUnit.x39_5,
              ),
            ]),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(children: [
              const SizedBox(
                height: SpacingUnit.x55,
              ),
              Image.asset(pathTextLogo),
            ]),
          ),
          Visibility(
              visible: isVisible,
              child: Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: SpacingUnit.x149),
                          minimumSize:
                              const Size(double.infinity, double.infinity)),
                      onPressed: () => onPress?.call(),
                      child: Text(
                        textButton,
                        style: theme.textTheme.bodyLarge!.copyWith(
                            color: colors.surfaceContainer,
                            fontWeight: FontWeight.w600),
                      ))))
        ]),
      ),
    );
  }
}
