import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/data/models/enums/character_type.dart';
import 'package:planet_defender/data/models/enums/level_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/character/character_bloc.dart';
import 'package:planet_defender/presentations/pages/select_character/level_setting_academic_and_ielts.dart';

class IntroducingCharacterSelectionPage extends StatefulWidget {
  const IntroducingCharacterSelectionPage({
    super.key,
    this.isSelectCosmo = false,
    this.pathNameCosmo = '',
    this.pathNameZina = '',
    this.textSkip = '',
    this.pathArrowRight = '',
    this.pathRobot = '',
    this.pathTextDialog = '',
    required this.character,
  });
  final bool isSelectCosmo;
  final String pathNameCosmo;
  final String pathNameZina;
  final String textSkip;
  final String pathRobot;
  final String pathTextDialog;
  final String pathArrowRight;
  final CharacterType character;

  @override
  State<IntroducingCharacterSelectionPage> createState() =>
      _IntroducingCharacterSelectionPageState();
}

class _IntroducingCharacterSelectionPageState
    extends State<IntroducingCharacterSelectionPage> {
  bool isSkip = false;
  List<String> listNameAcademic = [];
  List<String> listStringIelts = [];

  @override
  void initState() {
    initPage();
    super.initState();
  }

  void initPage() {
    setState(() {
      for (var element in AcademicType.values) {
        if (element != AcademicType.unknown) {
          listNameAcademic.add(element.name);
        }
      }
      for (var element in IeltsType.values) {
        if (element != IeltsType.unknown) {
          listStringIelts.add(element.name);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    if (isSkip) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: SpacingUnit.x22,
              child: InkWell(
                child: Text(
                  "Level setting",
                  style: theme.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w800, color: Colors.white),
                ),
              )),
          LevelSettingAcademicAndIelts(
            character: widget.character,
            listContentButtons: const [],
            isEnabledAcademic: true,
            isSelectCosmo: true,
            pathNameCosmo: Assets.images.cosmoScreen.path,
            pathNameZina: Assets.images.zinaScreen.path,
            pathDisabledLeft: Assets.images.buttonDisabledLeft.path,
            pathDisabledRight: Assets.images.buttonDisabledRight.path,
            pathEnabledLeft: Assets.images.buttonEnabledLeft.path,
            pathEnabledRight: Assets.images.buttonEnabledRight.path,
            pathBeveledBox: Assets.images.beveledBox.path,
            titleAcademic: 'Academic',
            titleButtonStart: 'START GAME',
            titleIelts: 'IELTS',
            onPress: () {
              dI<CharacterBloc>().add(const SelectCharacter());
              dI<AppNavigation>().push(context, page: Pages.home);
            },
            items: const [
              'This content is for students studying general English for educational purposes. It is divided into 6 levels, from beginner to advanced. ',
              'This content is for students preparing for the official IELTS exam. It is divided into 3 levels based on the target band score the learner wishes to achieve on the exam.'
            ],
          ),
        ],
      );
    } else {
      return GestureDetector(
        onTap: () {
          setState(() {
            isSkip = true;
          });
        },
        child: Stack(
          children: [
            Positioned(
              bottom: SpacingUnit.x46,
              child: Image.asset(
                widget.pathRobot,
                width: SpacingUnit.x35,
                height: SpacingUnit.x49,
              ),
            ),
            Column(
              children: [
                const Expanded(child: SizedBox()),
                Stack(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SvgPicture.asset(
                              widget.pathTextDialog,
                              height: SpacingUnit.x65,
                              fit: BoxFit.fill,
                            )),
                        Positioned(
                            top: 22,
                            right: SpacingUnit.x4,
                            child: GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: SpacingUnit.x10,
                                width: SpacingUnit.x25_5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isSkip = true;
                                        });
                                      },
                                      child: Text(widget.textSkip,
                                          style: theme.textTheme.labelLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: SpacingUnit.x3_5,
                                                  color:
                                                      colors.surfaceContainer)),
                                    ),
                                    const SizedBox(
                                      width: SpacingUnit.x2,
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
