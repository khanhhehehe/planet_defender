import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum GenderType {
  male('Male'),
  female('Female'),
  other('Other');

  final String name;
  const GenderType(this.name);
}

class AppInputGender extends StatefulWidget {
  final String hintText;
  final double bottomSheetHeight;
  final String imageBackgroundDialogPath;
  final String textButtonClose;
  final String textButtonSelect;
  final double boxItemDatePickerWidth;
  final double boxItemDatePickerHeight;
  final double itemDatePickerHeight;
  final ValueChanged<String> getValue;
  const AppInputGender({
    super.key,
    this.hintText = 'Gender',
    this.bottomSheetHeight = 312,
    this.imageBackgroundDialogPath = 'image path',
    this.textButtonClose = 'Close',
    this.textButtonSelect = 'Select',
    this.boxItemDatePickerWidth = 100,
    this.boxItemDatePickerHeight = 172,
    this.itemDatePickerHeight = 36,
    required this.getValue,
  });

  @override
  State<AppInputGender> createState() => _AppInputGenderState();
}

class _AppInputGenderState extends State<AppInputGender> {
  int datePickerQuantities = 1;
  GenderType? genderSelected;
  TextEditingController genderController = TextEditingController();
  @override
  void initState() {
    super.initState();
    genderController.text = '';
  }

  void setGender(GenderType genderSelected) {
    setState(() {
      genderController.text = genderSelected.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Center(
      child: GestureDetector(
        onTap: () {
          showBottomSheet(context);
        },
        child: Container(
            padding: EdgeInsets.only(
                right: SpacingUnit.x2_5,
                left: SpacingUnit.x2_5,
                top: genderSelected == null ? 0 : SpacingUnit.x2_5),
            decoration: BoxDecoration(
                color: genderController.text != ''
                    ? colors.surfaceContainerLowest
                    : theme.colorScheme.surface,
                borderRadius:
                    const BorderRadius.all(Radius.circular(SpacingUnit.x1)),
                border: Border.all(
                    color: genderController.text != ''
                        ? theme.colorScheme.outline
                        : Colors.transparent)),
            child: TextField(
              enabled: false,
              controller: genderController,
              style: theme.textTheme.labelLarge?.copyWith(
                  color: colors.textSecondary, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  labelText: widget.hintText,
                  labelStyle: theme.textTheme.labelLarge?.copyWith(
                      color: genderController.text != ''
                          ? colors.textTertiary
                          : colors.textSecondary,
                      fontWeight: FontWeight.w600),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: genderController.text != '' ? 1 : 0,
                          color: Colors.transparent))),
            )),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    genderSelected = GenderType.male;
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(SpacingUnit.x5))),
      builder: (BuildContext context) {
        return SizedBox(
          height: widget.bottomSheetHeight,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.imageBackgroundDialogPath),
                      fit: BoxFit.fill),
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(SpacingUnit.x5))),
              child: Column(
                children: [
                  const SizedBox(
                    height: SpacingUnit.x3,
                  ),
                  Container(
                    height: SpacingUnit.x1,
                    width: SpacingUnit.x8,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(SpacingUnit.x1)),
                      color: colors.surfaceContainer,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            widget.textButtonClose,
                            style: theme.textTheme.labelLarge!.copyWith(
                                color: colors.textSecondary,
                                fontWeight: FontWeight.w600),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setGender(genderSelected!);
                            widget.getValue(genderSelected!.name);
                          },
                          child: Text(
                            widget.textButtonSelect,
                            style: theme.textTheme.labelLarge!.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: SpacingUnit.x8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: widget.boxItemDatePickerWidth,
                        height: widget.boxItemDatePickerHeight,
                        child: CupertinoPicker(
                          itemExtent: widget.itemDatePickerHeight,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          selectionOverlay:
                              CupertinoPickerDefaultSelectionOverlay(
                            background: CupertinoColors.white.withOpacity(0),
                          ),
                          onSelectedItemChanged: (int index) {
                            genderSelected = GenderType.values[index];
                          },
                          children: List<Widget>.generate(3, (int index) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    GenderType.values[index].name,
                                    style: theme.textTheme.labelLarge!.copyWith(
                                        color: colors.surfaceContainer),
                                  ),
                                ]);
                          }),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }
}
