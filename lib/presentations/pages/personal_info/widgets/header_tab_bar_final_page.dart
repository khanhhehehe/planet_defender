import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/final_tab_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_widgets/buttons/button_rectangle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderTabBarFinalPage extends StatefulWidget {
  const HeaderTabBarFinalPage({
    super.key,
  });

  @override
  State<HeaderTabBarFinalPage> createState() => _HeaderTabBarFinalPageState();
}

class _HeaderTabBarFinalPageState extends State<HeaderTabBarFinalPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
      buildWhen: (previous, current) => previous.tabType != current.tabType,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: SpacingUnit.x1_5),
          child: Row(
            children: FinalTabType.values.map((e) {
              return Expanded(
                  child: ButtonRectangle(
                isEnabled: state.tabType == e ? true : false,
                imageBackground: Assets.images.buttonBaseSecond.path,
                title: e.name,
                fontStyle: FontStyle.italic,
                onPress: () {
                  dI<PersonalInfoBloc>().add(ChangeTab(type: e));
                },
                titleColor: Colors.white,
              ));
            }).toList(),
          ),
        );
      },
    );
  }
}
