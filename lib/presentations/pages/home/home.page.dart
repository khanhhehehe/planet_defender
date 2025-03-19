import 'dart:async';

import 'package:base_widgets/buttons/button_home_screen.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:base_themes/base_color.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/data/models/request/game_history_request.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_history/game_history_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_history/game_history_state.dart';
import 'package:planet_defender/presentations/bloc/question/question_bloc.dart';
import 'package:planet_defender/presentations/bloc/question/question_state.dart';
import 'package:planet_defender/presentations/bloc/user/user_bloc.dart';
import 'package:planet_defender/presentations/pages/game_play/widget/exp_bar.dart';
import 'package:planet_defender/presentations/pages/market_place/market_place.page.dart';
import 'package:planet_defender/presentations/pages/wiki_book/wiki_book.page.dart';
import 'package:planet_defender/presentations/widgets/bottom_navigation.dart';

final homePageRoute = GoRoute(
    path: Pages.home,
    builder: (context, GoRouterState state) => const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgets() => [
        const Home(),
        WikiBookPage(onItemTapped: _onItemTapped),
        const MarketPlacePage()
      ];
  @override
  void initState() {
    super.initState();
    dI<UserBloc>().add(const GetUserInfo());
    dI<GameHistoryBloc>().add(const InitGameHistory());
  }

  void _onItemTapped(int index) {
    setState(() {
      dI<BottomNavigationCubit>().changeTab(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final widgets = _widgets();
    return Scaffold(
        bottomNavigationBar: BottomNavigationApp(
            selectedIndex: dI<BottomNavigationCubit>().state,
            onItemTapped: _onItemTapped),
        body: widgets.elementAt(dI<BottomNavigationCubit>().state));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> playGame({required int round}) async {
    Completer completerInit = Completer<bool>();
    dI<QuestionBloc>().add(InitQuestions(completer: completerInit));
    await completerInit.future;
    dI<QuestionBloc>().add(const ChangePauseStatus(pauseStatus: false));
    Completer completer = Completer<GameHistoryStatus>();
    dI<GameHistoryBloc>().add(SaveGameHistory(
        gameHistoryRequest: GameHistoryRequest(), completer: completer));
    GameHistoryStatus status = await completer.future;
    dI<BuffBloc>().add(const SetCountZMaster(item: 0));
    if (status == GameHistoryStatus.success) {
      goGamePlay();
      dI<GameHistoryBloc>().add(const InitGameHistory());
      setMaxHeight();
      dI<QuestionBloc>().add(const GetTimeConfig());
      if (round == 0) {
        dI<QuestionBloc>().add(const ChangeRound());
      }
    }
  }

  void goGamePlay() {
    dI<AppNavigation>()
        .replace(context, page: Pages.gamePlay, paramsQuery: {"data": "false"});
  }

  void setMaxHeight() {
    dI<QuestionBloc>()
        .add(SetMaxHeight(maxHeight: MediaQuery.sizeOf(context).height / 0.75));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameHistoryBloc, GameHistoryState>(
      listenWhen: (previous, current) =>
          previous.gameHistoryStatus != current.gameHistoryStatus,
      listener: (context, state) {
        if (state.gameHistoryStatus == GameHistoryStatus.success) {}
      },
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.cosmoScreen.path),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: SpacingUnit.x15),
              Container(
                  alignment: Alignment.center,
                  child: const Center(child: ExpBar())),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonHomeScreen(
                      callback: () {
                        dI<AppNavigation>().push(context,
                            page: Pages.gamePlay,
                            paramsQuery: {"data": "true"});
                      },
                      height: SpacingUnit.x14,
                      width: MediaQuery.of(context).size.width / 2 - 45,
                      pathName: Assets.images.homeButtonDark.path,
                    ),
                    BlocBuilder<QuestionBloc, QuestionState>(
                      builder: (context, questionState) {
                        return ButtonHomeScreen(
                          callback: () {
                            playGame(round: questionState.round);
                          },
                          height: SpacingUnit.x14,
                          width: MediaQuery.of(context).size.width / 2 - 45,
                          pathName: Assets.images.homeButtonLight.path,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: SpacingUnit.x3,
              )
            ],
          ),
        ),
        Positioned(
          right: 5,
          bottom: 80,
          child: IconButton(
              onPressed: () =>
                  dI<AppNavigation>().push(context, page: Pages.activitiesGame),
              icon: Image.asset(Assets.images.activities.path)),
        )
      ]),
    );
  }
}

class ItemBottomNavigation extends StatelessWidget {
  final String icon;
  final String label;
  final int currentIndex;
  final int itemIndex;
  const ItemBottomNavigation(
      {super.key,
      required this.icon,
      this.label = '',
      required this.currentIndex,
      required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return SizedBox(
      height: SpacingUnit.x13,
      child: Stack(children: [
        Column(
          children: [
            const SizedBox(width: double.infinity, height: SpacingUnit.x1),
            SvgPicture.asset(icon),
            const SizedBox(height: SpacingUnit.x2),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: currentIndex == itemIndex
                      ? colors.onSurface
                      : colors.outline),
            )
          ],
        ),
        Align(
            alignment: Alignment.center,
            child: currentIndex == itemIndex
                ? SvgPicture.asset(Assets.svg.highlightNavigation)
                : const SizedBox())
      ]),
    );
  }
}
