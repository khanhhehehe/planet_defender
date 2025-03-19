import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/molecules/personal_info/exp_spaceship.dart';
import 'package:base_widgets/molecules/personal_info/professional_spaceship.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> spaceShips = [
  Assets.images.spaceship.path,
  Assets.images.spaceship.path,
  Assets.images.spaceship.path
];

class ExpSpaceship extends StatelessWidget {
  const ExpSpaceship({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        builder: (context, state) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: SpacingUnit.x7_5),
            child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Thông thạo phi thuyền',
                  style: theme.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w700, color: colors.textSecondary),
                )),
          ),
          const SizedBox(height: SpacingUnit.x5),
          ProfessionalSpaceship(
            title: state.gameLevel,
            level: state.level,
            used: state.spaceshipUsed,
            bgImageSpaceShip: Assets.images.backgroundSpaceship.path,
            imageSpaceShip: Assets.images.spaceship.path,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: SpacingUnit.x12_5, vertical: SpacingUnit.x2_5),
            child: GridView.builder(
              itemCount: spaceShips.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, childAspectRatio: 2),
              itemBuilder: (context, index) {
                return ExpSpaceShip(
                  spaceShips: spaceShips,
                  index: index,
                  spaceShipImage: Assets.images.backgroundSpaceship.path,
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
