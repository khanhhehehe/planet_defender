import 'package:base_widgets/border/border_select_item_intro.dart';
import 'package:base_widgets/gen/assets.gen.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

enum SpecialButton {
  shift('shift'),
  delete('delete'),
  capitalization('capitalization'),
  space('space'),
  enter('enter'),
  goKeyBoard('ABC'),
  goSkill('Skill');

  final String name;
  const SpecialButton(this.name);
}

final rowsForm = [14, 2];
final List<List<String>> keyText = [
  ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
  ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
  [
    SpecialButton.capitalization.name,
    "z",
    "x",
    "c",
    "v",
    "b",
    "n",
    "m",
    SpecialButton.delete.name,
  ],
  [
    SpecialButton.goSkill.name,
    SpecialButton.space.name,
    SpecialButton.enter.name
  ]
];

final List<List<String>> keyNumber = [
  ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
  ["-", "/", ":", ";", "(", ")", "₫", "&", "@", '"'],
  [
    SpecialButton.capitalization.name,
    ".",
    ",",
    "?",
    "!",
    "'",
    SpecialButton.delete.name,
  ],
  [
    SpecialButton.goSkill.name,
    SpecialButton.space.name,
    SpecialButton.enter.name
  ]
];

class KeyBoard extends StatefulWidget {
  final String imageBackground;
  final String imageBackgroundMedia;
  final String imageBackgroundQuest;
  final String formFire;
  final String buttonEnter;
  final VoidCallback showSkill;
  final VoidCallback enter;
  final bool showQuest;
  final bool isFire;
  final ValueChanged onChange;
  final bool isIntroContainer;
  final bool isIntroButtonSkill;
  final bool isIntroFire;
  final bool isSelectCancel;
  final VoidCallback onCancel;
  final TextEditingController controller;
  final bool isIntroNextQuestion;
  const KeyBoard(
      {super.key,
      required this.imageBackground,
      required this.imageBackgroundMedia,
      required this.imageBackgroundQuest,
      required this.formFire,
      required this.buttonEnter,
      required this.showSkill,
      required this.enter,
      this.showQuest = true,
      this.isIntroFire = false,
      required this.onChange,
      required this.isIntroContainer,
      this.isFire = false,
      this.isIntroButtonSkill = false,
      required this.isSelectCancel,
      required this.onCancel,
      required this.controller,
      required this.isIntroNextQuestion});

  @override
  State<KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  bool isCapitalization = false;
  bool isNumber = false;
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode.requestFocus(),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            if (widget.showQuest == true) ...[
              Row(
                children: [
                  Expanded(
                    flex: rowsForm[0],
                    child: CustomPaint(
                      painter:
                          widget.isIntroContainer ? BorderSelectItem() : null,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: SpacingUnit.x6,
                            right: SpacingUnit.x6,
                            bottom: SpacingUnit.x0_5),
                        height: MediaQuery.sizeOf(context).width / 11,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.formFire),
                              fit: BoxFit.fill),
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          showCursor: true,
                          controller: widget.controller,
                          autofocus: true,
                          focusNode: focusNode,
                          readOnly: true,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: rowsForm[1],
                    child: CustomPaint(
                      painter: widget.isIntroFire
                          ? BorderSelectItem(width: 10)
                          : null,
                      child: GestureDetector(
                        onTap: () {
                          widget.enter.call();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width / 11,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.buttonEnter),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: SpacingUnit.x3),
            ],
            Expanded(child: _widgetKeyBoard()),
            const SizedBox(height: SpacingUnit.x3),
            const SizedBox(
              height: SpacingUnit.x4,
            )
          ],
        ),
      ),
    );
  }

  Widget _widgetKeyBoard() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (isNumber) ...[
            ...keyNumber
                .map((item) => Wrap(
                      spacing: SpacingUnit.x1,
                      alignment: WrapAlignment.spaceBetween,
                      children: item
                          .map((e) => _getBackgroundKey(e,
                              onTextChange: (String value) {
                                widget.controller.text =
                                    widget.controller.text + value;
                                widget.onChange(widget.controller.text);
                              },
                              enter: () {
                                widget.onCancel.call();
                              },
                              isIntroFire: widget.isIntroFire,
                              isFire: widget.isFire,
                              isIntroSkill: widget.isIntroButtonSkill,
                              openKeyNumber: () {
                                setState(() {
                                  isNumber = !isNumber;
                                });
                              },
                              isIntroNextQuestion: widget.isIntroNextQuestion))
                          .toList(),
                    ))
                .toList(),
          ] else ...[
            ...keyText
                .map((item) => Wrap(
                      spacing: SpacingUnit.x1,
                      alignment: WrapAlignment.spaceBetween,
                      children: item
                          .map((e) => _getBackgroundKey(e,
                                  onTextChange: (String value) {
                                widget.controller.text =
                                    widget.controller.text + value;
                                widget.onChange(widget.controller.text);
                              }, enter: () {
                                widget.controller.text = '';
                                widget.onCancel.call();
                              },
                                  isIntroFire: widget.isIntroFire,
                                  isFire: widget.isFire,
                                  isIntroSkill: widget.isIntroButtonSkill,
                                  openKeyNumber: () {},
                                  isIntroNextQuestion:
                                      widget.isIntroNextQuestion))
                          .toList(),
                    ))
                .toList(),
          ]
        ],
      ),
    );
  }

  Widget _getBackgroundKey(String key,
      {required ValueChanged<String> onTextChange,
      required VoidCallback enter,
      required VoidCallback openKeyNumber,
      required bool isFire,
      required bool isIntroFire,
      required bool isIntroSkill,
      required bool isIntroNextQuestion}) {
    if (key == SpecialButton.enter.name || key == SpecialButton.goSkill.name) {
      return _KeyBoardSpecial(
        title: key,
        onTap: () {
          if (key == SpecialButton.goSkill.name) {
            setState(() {
              isNumber = !isNumber;
            });
          } else {
            enter.call();
          }
        },
        isIntroFire: isIntroFire,
        isFire: isFire,
        isIntroSkill: isIntroSkill,
        isNumber: isNumber,
        isIntroNextQuestion: isIntroNextQuestion,
      );
    }
    if (key == SpecialButton.space.name) {
      return _KeyBoardSpace(
        onSpace: (String value) {
          widget.controller.text = "${widget.controller.text} ";
          widget.onChange(widget.controller.text);
        },
      );
    }
    if (key == SpecialButton.capitalization.name ||
        key == SpecialButton.delete.name) {
      return _KeyBoardShiftOrDelete(
        title: key,
        onTap: () {
          setState(() {
            if (key == SpecialButton.capitalization.name) {
              isCapitalization = !isCapitalization;
            } else {
              if (widget.controller.text.isNotEmpty) {
                widget.controller.text = widget.controller.text
                    .substring(0, widget.controller.text.length - 1);
                widget.onChange(widget.controller.text);
              }
            }
          });
        },
      );
    }
    return _KeyBoardText(
      title: isCapitalization ? key.toUpperCase() : key,
      onChange: (value) => onTextChange(value),
    );
  }
}

class _KeyBoardText extends StatelessWidget {
  final String title;
  final ValueChanged onChange;
  const _KeyBoardText({required this.title, required this.onChange});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FittedBox(
      fit: BoxFit.contain,
      child: GestureDetector(
        onTap: () => onChange(title),
        child: Container(
            width: MediaQuery.of(context).size.width / 11.5,
            height: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.images.bgTextKey.path),
                  fit: BoxFit.fill),
            ),
            child: Center(
                child: Text(
              title,
              style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
            ))),
      ),
    );
  }
}

class _KeyBoardSpace extends StatelessWidget {
  final ValueChanged<String> onSpace;
  const _KeyBoardSpace({required this.onSpace});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSpace(""),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.width / 10,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.images.spaceKeyBoard.path),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}

class _KeyBoardSpecial extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isIntroFire;
  final bool isIntroSkill;
  final bool isFire;
  final bool isNumber;
  final bool isIntroNextQuestion;
  const _KeyBoardSpecial(
      {required this.title,
      required this.onTap,
      required this.isIntroFire,
      required this.isFire,
      required this.isIntroSkill,
      required this.isNumber,
      required this.isIntroNextQuestion});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: CustomPaint(
        painter: isIntroNextQuestion && title == SpecialButton.enter.name
            ? BorderSelectItem(width: 10)
            // :
            // isIntroSkill && title == SpecialButton.goSkill.name
            //     ? BorderSelectItem(width: 10)
            : null,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.width / 11,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(title == SpecialButton.goSkill.name
                    ? checkShowNumber()
                    : Assets.images.rightKeyBoard.path),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  String checkShowNumber() {
    return !isNumber
        ? Assets.images.leftKeyBoard.path
        : Assets.images.buttonAbc.path;
  }
}

class _KeyBoardShiftOrDelete extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _KeyBoardShiftOrDelete({required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        margin: title == SpecialButton.capitalization.name
            ? const EdgeInsets.only(right: SpacingUnit.x2)
            : const EdgeInsets.only(left: SpacingUnit.x2),
        width: MediaQuery.of(context).size.width / 10,
        height: MediaQuery.of(context).size.width / 10,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(title == SpecialButton.capitalization.name
                  ? Assets.images.bgKeyShiftKey.path
                  : Assets.images.bgKeyDeleteKey.path),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
