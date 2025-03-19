import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonShowBottomSheetSettingApp extends StatefulWidget {
  ButtonShowBottomSheetSettingApp(
      {super.key,
      required this.indexContent,
      required this.indexParent,
      required this.isEnabledAcademic,
      required this.pathImageEnabled,
      required this.pathImageDisable,
      required this.onTap});

  late bool isEnabledAcademic;
  late int indexContent;
  late int indexParent;
  final String pathImageEnabled;
  final String pathImageDisable;

  final VoidCallback onTap;

  @override
  State<ButtonShowBottomSheetSettingApp> createState() =>
      _ButtonShowBottomSheetSettingAppState();
}

class _ButtonShowBottomSheetSettingAppState
    extends State<ButtonShowBottomSheetSettingApp> {
  @override
  Widget build(BuildContext context) {
    return widget.isEnabledAcademic
        ? GestureDetector(
            onTap: () {
              widget.onTap.call();
            },
            child: Image.asset(
              widget.pathImageEnabled,
              height: SpacingUnit.x10,
              width: MediaQuery.of(context).size.width / 2 - 6,
              fit: BoxFit.fill,
            ),
          )
        : GestureDetector(
            onTap: () {
              widget.onTap.call();
            },
            child: Image.asset(
              widget.pathImageDisable,
              height: SpacingUnit.x10,
              width: MediaQuery.of(context).size.width / 2 - 6,
              fit: BoxFit.fill,
            ),
          );
  }
}
