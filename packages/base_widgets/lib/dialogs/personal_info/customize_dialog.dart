import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class CustomizeDialog extends StatelessWidget {
  final String? backgroundImage;
  final List<Widget> children;
  final String title;
  const CustomizeDialog(
      {super.key,
      this.backgroundImage,
      required this.children,
      this.title = 'title dialog'});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x7),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SpacingUnit.x3)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x2_5),
        height: SpacingUnit.x163,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SpacingUnit.x3),
            image: backgroundImage != null
                ? DecorationImage(
                    image: AssetImage(backgroundImage!), fit: BoxFit.fill)
                : null),
        child: Column(
          children: [
            const SizedBox(height: SpacingUnit.x4),
            Text(
              title,
              style: theme.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.w700, color: colors.surface),
            ),
            ...children
          ],
        ),
      ),
    );
  }
}
