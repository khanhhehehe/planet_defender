import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/data/models/enums/character_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/character/character_bloc.dart';
import 'package:planet_defender/presentations/bloc/character/character_state.dart';
import 'package:planet_defender/presentations/pages/select_character/introducing_character_selection_page.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final characterPageRoute = GoRoute(
    path: Pages.character,
    builder: (context, GoRouterState state) => const CharacterPage());

class CharacterPage extends StatefulWidget {
  const CharacterPage({
    super.key,
    this.pathNameCosmo = '',
    this.pathNameZina = '',
    this.isSelectCosmo = false,
    this.textSelectButton = '',
    this.pathNameFemale = '',
    this.pathNameMale = '',
    this.isSkip = false,
  });
  final bool isSelectCosmo;
  final String pathNameCosmo;
  final String pathNameZina;
  final String textSelectButton;
  final String pathNameMale;
  final String pathNameFemale;
  final bool isSkip;

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  bool isSkip = false;
  bool _isShowBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(
              top: SpacingUnit.x13_5, bottom: SpacingUnit.x14),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(state.character == CharacterType.cosmo
                    ? Assets.images.cosmoScreen.path
                    : Assets.images.zinaScreen.path),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              if (_isShowBottomSheet == false)
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Image.asset(
                    state.character == CharacterType.cosmo
                        ? Assets.images.male.path
                        : Assets.images.female.path,
                    // Assets.images.female.path,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              const Expanded(child: SizedBox()),
              CustomSelectButton(
                  height: SpacingUnit.x10,
                  textButton: "Select",
                  callback: () => showBottomSheet())
            ],
          ),
        );
      },
    );
  }

  void showBottomSheet() {
    setState(() {
      _isShowBottomSheet = true;
    });
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isShowBottomSheet = false;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
            FractionallySizedBox(
              heightFactor: 1,
              child: IntroducingCharacterSelectionPage(
                isSelectCosmo: false,
                pathArrowRight: Assets.images.arrowRight.path,
                pathNameCosmo: Assets.images.cosmoScreen.path,
                pathNameZina: Assets.images.zinaScreen.path,
                pathRobot: Assets.images.robot.path,
                pathTextDialog: 'assets/svg/text_dialogue.svg',
                textSkip: 'skip',
                character: CharacterType.zina,
              ),
            ),
          ],
        );
      },
    );
  }
}
