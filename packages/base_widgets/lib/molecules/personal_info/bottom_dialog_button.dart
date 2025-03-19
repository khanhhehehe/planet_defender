import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/button_close.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class BottomDialogButton extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onTag;
  final String textButton;
  final VoidCallback onSave;
  final String? actionImage;
  const BottomDialogButton(
      {super.key,
      required this.onClose,
      required this.onTag,
      this.textButton = 'title',
      required this.onSave,
      this.actionImage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonClose(
          child: Icon(Icons.close, color: theme.colorScheme.primary),
          onPress: () => onClose.call(),
        ),
        Container(
            width: SpacingUnit.x30,
            height: SpacingUnit.x10_5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SpacingUnit.x1),
                boxShadow: [
                  BoxShadow(
                      color: colors.tonalPalettes.tertiary.tp500,
                      offset: const Offset(0, 2))
                ],
                gradient: LinearGradient(
                    colors: colors.gradientNavy,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: TextButton(
              onPressed: () {},
              child: Text(
                textButton,
                style: TextStyle(
                    fontSize: SpacingUnit.x3_5,
                    fontWeight: FontWeight.w700,
                    color: colors.tonalPalettes.shade.tp0),
              ),
            )),
        ButtonClose(
          child: actionImage != null
              ? Image(image: AssetImage(actionImage!))
              : const SizedBox(),
          onPress: () => onClose.call(),
        ),
      ],
    );
  }
}
