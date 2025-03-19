import 'package:base_themes/base_color.dart';
import 'package:base_widgets/gen/assets.gen.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class BaseAppSettingScreen extends StatelessWidget {
  const BaseAppSettingScreen({
    super.key,
    this.textTitle = '',
    this.child = const SizedBox(),
    this.alignment = Alignment.topCenter,
  });
  final String textTitle;
  final Widget child;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Scaffold(
      backgroundColor: colors.surfaceContainerLowest,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: SpacingUnit.x12,
              left: SpacingUnit.x4,
              right: SpacingUnit.x4,
              bottom: SpacingUnit.x6),
          child: Container(
            height: MediaQuery.of(context).size.height - SpacingUnit.x18,
            width: MediaQuery.of(context).size.width - SpacingUnit.x8,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.images.bgAppSetting.path),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(SpacingUnit.x3),
            ),
            child: Column(children: [
              const SizedBox(height: SpacingUnit.x2_5),
              Flexible(
                  flex: 1,
                  child: Container(
                    alignment: alignment,
                    child: Text(
                      textTitle,
                      style: theme.textTheme.labelLarge?.copyWith(
                          color: colors.onSecondary,
                          fontWeight: FontWeight.w700,
                          fontSize: SpacingUnit.x5_5),
                    ),
                  )),
              Expanded(flex: 4, child: SingleChildScrollView(child: child)),
              const SizedBox(height: SpacingUnit.x12)
            ]),
          ),
        ),
      ),
    );
  }
}
