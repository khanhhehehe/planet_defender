import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInputDatePicker extends StatefulWidget {
  final String hintText;
  final double bottomSheetHeight;
  final String imageBackgroundPath;
  final String textButtonClose;
  final String textButtonSelect;
  final double boxItemDatePickerWidth;
  final double boxItemDatePickerHeight;
  final double itemDatePickerHeight;
  final ValueChanged<String> getValue;
  const AppInputDatePicker({
    super.key,
    this.hintText = 'Date of birth',
    this.bottomSheetHeight = 312,
    this.imageBackgroundPath = 'image path',
    this.textButtonClose = 'Close',
    this.textButtonSelect = 'Select',
    this.boxItemDatePickerWidth = 100,
    this.boxItemDatePickerHeight = 172,
    this.itemDatePickerHeight = 36,
    required this.getValue,
  });

  @override
  State<AppInputDatePicker> createState() => _AppInputDatePickerState();
}

class _AppInputDatePickerState extends State<AppInputDatePicker> {
  DateTime dateNow = DateTime.now();
  int datePickerQuantities = 3;
  List<int> listDays = [];
  List<int> listMonths = [];
  List<int> listYears = [];
  late int daySelected;
  late int monthSelected;
  late int yearSelected;
  String dateSelected = '';
  int gapYear = 199;
  @override
  void initState() {
    super.initState();
    listDays = List.generate(31, (index) => index + 1);
    listMonths = List.generate(12, (index) => index + 1);
    listYears = List.generate(200, (index) => dateNow.year - 199 + index);
    daySelected = dateNow.day;
    monthSelected = dateNow.month;
    yearSelected = dateNow.year;
  }

  void setDate(int day, int month, int year) {
    setState(() {
      dateSelected = '$daySelected/$monthSelected/$yearSelected';
      widget.getValue(dateSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    dateController.text = dateSelected;
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Center(
      child: GestureDetector(
        onTap: () {
          newMethod(context);
        },
        child: Container(
            padding: EdgeInsets.only(
                right: SpacingUnit.x2_5,
                left: SpacingUnit.x2_5,
                top: dateSelected == '' ? 0 : SpacingUnit.x2_5),
            decoration: BoxDecoration(
                color: dateController.text != ''
                    ? colors.surfaceContainerLowest
                    : theme.colorScheme.surface,
                borderRadius:
                    const BorderRadius.all(Radius.circular(SpacingUnit.x1)),
                border: Border.all(
                    color: dateController.text != ''
                        ? theme.colorScheme.outline
                        : Colors.transparent)),
            child: TextField(
              enabled: false,
              controller: dateController,
              style: theme.textTheme.labelLarge?.copyWith(
                  color: colors.textSecondary, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  labelText: widget.hintText,
                  labelStyle: theme.textTheme.labelLarge?.copyWith(
                      color: dateController.text != ''
                          ? colors.textTertiary
                          : colors.textSecondary,
                      fontWeight: FontWeight.w600),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: dateController.text != '' ? 1 : 0,
                          color: Colors.transparent))),
            )),
      ),
    );
  }

  Future<void> newMethod(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
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
                      image: AssetImage(widget.imageBackgroundPath),
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
                            setDate(daySelected, monthSelected, yearSelected);
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
                  ContentSelectDate(
                    datePickerQuantities: datePickerQuantities,
                    boxItemDatePickerWidth: widget.boxItemDatePickerWidth,
                    boxItemDatePickerHeight: widget.boxItemDatePickerHeight,
                    itemDatePickerHeight: widget.itemDatePickerHeight,
                    dateNow: dateNow,
                    gapYear: gapYear,
                    onSelectedItemChanged: (int index, int i) {
                      setState(() {
                        if (i == 0) {
                          daySelected = listDays[index];
                        } else if (i == 1) {
                          monthSelected = listMonths[index];
                        } else {
                          yearSelected = listYears[index];
                        }
                      });
                    },
                    listDays: listDays,
                    listMonths: listMonths,
                    listYears: listYears,
                  ),
                ],
              )),
        );
      },
    );
  }
}

class ContentSelectDate extends StatelessWidget {
  final int datePickerQuantities;
  final double boxItemDatePickerWidth;
  final double boxItemDatePickerHeight;
  final double itemDatePickerHeight;
  final DateTime dateNow;
  final int gapYear;
  final Function(int index, int i) onSelectedItemChanged;
  final List<int> listDays;
  final List<int> listMonths;
  final List<int> listYears;

  const ContentSelectDate(
      {super.key,
      required this.datePickerQuantities,
      required this.boxItemDatePickerWidth,
      required this.boxItemDatePickerHeight,
      required this.itemDatePickerHeight,
      required this.dateNow,
      required this.gapYear,
      required this.onSelectedItemChanged,
      required this.listDays,
      required this.listMonths,
      required this.listYears});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < datePickerQuantities; i++)
          SizedBox(
            width: boxItemDatePickerWidth,
            height: boxItemDatePickerHeight,
            child: CupertinoPicker(
              itemExtent: itemDatePickerHeight,
              scrollController: FixedExtentScrollController(
                  initialItem: i == 0
                      ? dateNow.day - 1
                      : (i == 1 ? dateNow.month - 1 : gapYear)),
              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                background: CupertinoColors.white.withOpacity(0),
              ),
              onSelectedItemChanged: (int index) =>
                  onSelectedItemChanged(index, i),
              children: List<Widget>.generate(
                  (i == 0)
                      ? listDays.length
                      : (i == 1)
                          ? listMonths.length
                          : listYears.length, (int index) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (i == 0
                            ? (index + 1).toString().padLeft(2, '0')
                            : (i == 1
                                ? (index + 1).toString().padLeft(2, '0')
                                : (dateNow.year - gapYear + index).toString())),
                        style: theme.textTheme.labelLarge!.copyWith(
                            color: colors.surfaceContainerLow,
                            fontWeight: FontWeight.w600),
                      ),
                    ]);
              }),
            ),
          ),
      ],
    );
  }
}
