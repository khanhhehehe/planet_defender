import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/data/models/enums/character_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/character/character_bloc.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final selectACharacterPageRoute = GoRoute(
    path: Pages.selectCharacter,
    builder: (context, GoRouterState state) => const SelectACharacterPage());

class SelectACharacterPage extends StatelessWidget {
  const SelectACharacterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  dI<CharacterBloc>()
                      .add(const SetCharacter(character: CharacterType.zina));
                  dI<AppNavigation>().push(context, page: Pages.character);
                },
                child: Image.asset(
                  Assets.images.zina.path,
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                onTap: () {
                  dI<CharacterBloc>()
                      .add(const SetCharacter(character: CharacterType.cosmo));
                  dI<AppNavigation>().push(context, page: Pages.character);
                },
                child: Image.asset(
                  Assets.images.cosmo.path,
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 27,
            child: Image.asset(
              Assets.images.frame.path,
              fit: BoxFit.fill,
              height: SpacingUnit.x13_5,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}
