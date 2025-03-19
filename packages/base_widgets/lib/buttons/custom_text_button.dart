import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      this.textColor = Colors.black,
      this.textButton = '',
      required this.onPressed});
  final Color textColor;
  final String textButton;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: () {
        onPressed.call();
      },
      child: Text(
        textButton,
        style: theme.textTheme.labelSmall?.copyWith(
          color: textColor,
          fontSize: SpacingUnit.x2_75,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
