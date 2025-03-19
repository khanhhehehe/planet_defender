import 'package:planet_defender/data/models/enums/dialog_type.dart';
import 'package:planet_defender/presentations/themes/themes.dart';
import 'package:flutter/material.dart';

class DialogIcon extends StatelessWidget {
  const DialogIcon({
    super.key,
    required this.dialogType,
  });

  final DialogType dialogType;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.getColors(context);
    switch (dialogType) {
      case DialogType.success:
        return Icon(
          Icons.check_circle_outlined,
          color: colors.success,
        );
      case DialogType.error:
        return Icon(
          Icons.highlight_remove_outlined,
          color: colors.error,
        );
      case DialogType.notify:
        return Icon(
          Icons.info_outline,
          color: colors.primary,
        );
      case DialogType.warning:
        return Icon(
          Icons.warning,
          color: colors.tertiary,
        );
      default:
        return Icon(
          Icons.info_outline,
          color: colors.primary,
        );
    }
  }
}
