import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/button_close.dart';
import 'package:base_widgets/buttons/button_rectangle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/activities/activities_bloc.dart';
import 'package:planet_defender/presentations/pages/activities_game/activitiy_news.dart';
import 'package:planet_defender/presentations/pages/activities_game/activity_update.dart';

enum Events {
  news("NEWS"),
  update("UPDATE");

  final String name;
  const Events(this.name);
}

final activitiesGame = GoRoute(
    path: Pages.activitiesGame,
    builder: (context, GoRouterState state) => const ActivitiesGamePage());

int indexSelected = -1;

class ActivitiesGamePage extends StatefulWidget {
  const ActivitiesGamePage({super.key});

  @override
  State<ActivitiesGamePage> createState() => _ActivitiesGamePageState();
}

class _ActivitiesGamePageState extends State<ActivitiesGamePage> {
  Events initScreen = Events.news;
  void _changeScreen(Events value) {
    if (initScreen != value) {
      setState(() {
        initScreen = value;
      });
    }
  }

  String _buttonImage() {
    return initScreen == Events.news
        ? Assets.images.buttonBase.path
        : Assets.images.buttonBaseSecond.path;
  }

  @override
  void initState() {
    dI<ActivitiesBloc>().add(const GetActivities());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Scaffold(
      body: Stack(children: [
        Container(
            color: colors.surfaceContainerLowest,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
            child: Column(
              children: [
                const SizedBox(height: SpacingUnit.x10_5),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.83,
                  child:
                      initScreen == Events.news ? const News() : const Update(),
                ),
                const SizedBox(height: SpacingUnit.x6),
                Container(
                  padding: const EdgeInsets.only(top: SpacingUnit.x1_5),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.images.bgHeaderButtons.path),
                          fit: BoxFit.fitWidth)),
                  child: Row(
                    children: Events.values.map((e) {
                      return Expanded(
                          child: ButtonRectangle(
                        isEnabled: e == initScreen,
                        imageBackground: _buttonImage(),
                        title: e.name,
                        fontStyle: FontStyle.italic,
                        onPress: () {
                          _changeScreen(e);
                        },
                        titleColor: Colors.white,
                      ));
                    }).toList(),
                  ),
                ),
              ],
            )),
        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.13,
            right: SpacingUnit.x11,
            child: ButtonClose(
              child: Icon(Icons.close, color: colors.textSecondary),
              onPress: () => dI<AppNavigation>().pop(context),
            )),
      ]),
    );
  }
}

void selectItem(int index) {
  indexSelected = index == indexSelected ? -1 : index;
}
