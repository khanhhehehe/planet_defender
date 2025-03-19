import 'package:planet_defender/data/models/enums/dialog_type.dart';
import 'package:planet_defender/presentations/themes/themes.dart';
import 'package:planet_defender/presentations/widgets/app_button.dart';
import 'package:planet_defender/presentations/widgets/app_dialog_icon.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String content;
  final DialogType? dialogType;
  final Function? onClose;

  const AppDialog(
      {super.key,
      required this.content,
      this.dialogType = DialogType.notify,
      this.onClose});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.getColors(context);
    final theme = Theme.of(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      backgroundColor: colors.background,
      contentPadding:
          const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 16,
              ),
              DialogIcon(dialogType: dialogType!),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  content,
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 16, right: 16, bottom: 4),
            child: AppButton(
              title: 'Confirm',
              onSubmit: () {
                if (onClose != null) {
                  onClose!();
                } else {
                  Navigator.of(context).pop();
                }
              },
              color: colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
