import 'package:base_themes/base_color.dart';
import 'package:base_widgets/border/border_select_item_intro.dart';
import 'package:base_widgets/gen/assets.gen.dart';
import 'package:base_widgets/key_board/keyboard.dart';
import 'package:flutter/material.dart';

enum SkillType { skill1, skill2, skill3, skill4, none }

class SelectSkill extends StatefulWidget {
  final VoidCallback onEnter;
  final VoidCallback onGoKeyboard;
  final bool introSkillItem;
  final bool autoSelectItem;
  const SelectSkill(
      {super.key,
      required this.onEnter,
      required this.onGoKeyboard,
      this.introSkillItem = false,
      required this.autoSelectItem});

  @override
  State<SelectSkill> createState() => _SelectSkillState();
}

class _SelectSkillState extends State<SelectSkill> {
  SkillType skill = SkillType.none;
  @override
  void initState() {
    setState(() {
      if (widget.autoSelectItem) {
        skill = SkillType.skill1;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemWith = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: skill == SkillType.skill1 ? itemWith / 3 : null,
            left: skill == SkillType.skill1 ? itemWith / 3 : itemWith / 3,
            child: GestureDetector(
              onTap: () => setState(() {
                if (skill == SkillType.skill1) {
                  skill = SkillType.none;
                } else {
                  skill = SkillType.skill1;
                }
              }),
              child: CustomPaint(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      Assets.images.skillSelect.path,
                      color: skill == SkillType.skill1
                          ? null
                          : BaseThemeColor.of(context).surfaceBright,
                      width: skill == SkillType.skill1
                          ? itemWith / 3.3
                          : itemWith / 3.5,
                      fit: BoxFit.fitWidth,
                    ),
                    Image.asset(
                      Assets.images.placeImage.path,
                      width: skill == SkillType.skill1
                          ? itemWith / 3.5
                          : itemWith / 3.8,
                      fit: BoxFit.fitWidth,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: skill == SkillType.skill2 ? itemWith / 3 : null,
              top: itemWith / 4.5,
              child: GestureDetector(
                onTap: () => setState(() {
                  if (skill == SkillType.skill2) {
                    skill = SkillType.none;
                  } else {
                    skill = SkillType.skill2;
                  }
                }),
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.images.skillSelect.path,
                      width: skill == SkillType.skill2
                          ? itemWith / 3.3
                          : itemWith / 3.5,
                      fit: BoxFit.fitWidth,
                      color: skill == SkillType.skill2
                          ? null
                          : BaseThemeColor.of(context).surfaceBright,
                    ),
                  ],
                ),
              )),
          Positioned(
              top: itemWith / 8.5,
              right:
                  skill == SkillType.skill3 ? itemWith / 7.5 : itemWith / 6.5,
              bottom: skill == SkillType.skill3 ? itemWith / 4.8 : null,
              child: GestureDetector(
                onTap: () => setState(() {
                  if (skill == SkillType.skill3) {
                    skill = SkillType.none;
                  } else {
                    skill = SkillType.skill3;
                  }
                }),
                child: Image.asset(
                  Assets.images.skillSelect.path,
                  width: skill == SkillType.skill3
                      ? itemWith / 3.3
                      : itemWith / 3.5,
                  fit: BoxFit.fitWidth,
                  color: skill == SkillType.skill3
                      ? null
                      : BaseThemeColor.of(context).surfaceBright,
                ),
              )),
          Positioned(
              top: itemWith / 8.9,
              bottom: skill == SkillType.skill4 ? itemWith / 4.6 : null,
              left: skill == SkillType.skill4 ? itemWith / 7.4 : itemWith / 6.5,
              child: GestureDetector(
                onTap: () => setState(() {
                  if (skill == SkillType.skill4) {
                    skill = SkillType.none;
                  } else {
                    skill = SkillType.skill4;
                  }
                }),
                child: Image.asset(
                  Assets.images.skillSelect.path,
                  width: skill == SkillType.skill4
                      ? itemWith / 3.3
                      : itemWith / 3.5,
                  fit: BoxFit.fill,
                  color: skill == SkillType.skill4
                      ? null
                      : BaseThemeColor.of(context).surfaceBright,
                ),
              )),
          Positioned(
              top: itemWith / 2.7,
              right: itemWith / 6,
              child: _ButtonSpecial(
                title: SpecialButton.enter.name,
                onEnter: () => widget.onEnter.call(),
              )),
          Positioned(
              top: itemWith / 2.7,
              left: itemWith / 6,
              child: _ButtonSpecial(
                title: SpecialButton.goKeyBoard.name,
                goKeyBoard: () => widget.onGoKeyboard.call(),
              )),
          if (widget.introSkillItem)
            Positioned(
                bottom: itemWith / 2.8,
                right: itemWith / 2.5,
                child: CustomPaint(
                  painter: BorderSelectItem(),
                  child: SizedBox(
                    width: itemWith / 4.5,
                    height: itemWith / 4.5,
                  ),
                ))
        ],
      ),
    );
  }
}

class _ButtonSpecial extends StatelessWidget {
  final String title;
  final VoidCallback? onEnter;
  final VoidCallback? goKeyBoard;
  const _ButtonSpecial({
    required this.title,
    this.onEnter,
    this.goKeyBoard,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == SpecialButton.enter.name) return onEnter?.call();
        return goKeyBoard?.call();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 11,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(title == SpecialButton.enter.name
                  ? Assets.images.rightKeyBoard.path
                  : Assets.images.buttonAbc.path),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}

class ItemSkill extends StatelessWidget {
  const ItemSkill({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
