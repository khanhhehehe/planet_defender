import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/button_rectangle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/market_place/characters/characters_bloc.dart';
import 'package:planet_defender/presentations/bloc/market_place/spaceships/spaceships_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:planet_defender/presentations/bloc/status_buy/status_buy_bloc.dart';
import 'package:planet_defender/presentations/bloc/status_buy/status_buy_state.dart';
import 'package:planet_defender/presentations/pages/market_place/characters_market.dart';
import 'package:planet_defender/presentations/pages/market_place/snackbar_market.dart';
import 'package:planet_defender/presentations/pages/market_place/spaceships_market.dart';

enum MarketType {
  spaceShip("Spaceship"),
  character("Character");

  final String name;
  const MarketType(this.name);
}

final marketPlacePage = GoRoute(
    path: Pages.marketPlace,
    builder: (context, GoRouterState state) => const MarketPlacePage());

class MarketPlacePage extends StatefulWidget {
  const MarketPlacePage({super.key});

  @override
  State<MarketPlacePage> createState() => _MarketPlacePageState();
}

class _MarketPlacePageState extends State<MarketPlacePage> {
  MarketType initScreen = MarketType.spaceShip;
  void _changeScreen(MarketType value) {
    if (initScreen != value) {
      setState(() {
        initScreen = value;
      });
    }
  }

  String _buttonBackground(MarketType value) {
    return value == MarketType.spaceShip
        ? Assets.images.buttonBase.path
        : Assets.images.buttonBaseSecond.path;
  }

  Color _buttonColor(BaseThemeColor colors, MarketType value) {
    return value == initScreen ? colors.onPrimary : colors.surfaceBright;
  }

  void hideSnackbar() {
    dI<StatusBuyBloc>().add(const ChangeStatusBuy(statusBuy: StatusBuy.init));
    dI<StatusBuyBloc>().add(const SetPrice(price: 0));
    dI<StatusBuyBloc>()
        .add(const ChangeStatusShowSnackBar(statusSnackBar: false));
  }

  @override
  void initState() {
    dI<SpaceshipsBloc>().add(const GetSpaceships());
    dI<CharactersBloc>().add(const GetCharacters());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Scaffold(
      body: Stack(children: [
        Container(
          color: colors.surfaceContainerLowest,
          child: Column(children: [
            const SizedBox(height: SpacingUnit.x10_5),
            Stack(children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
                padding: const EdgeInsets.all(SpacingUnit.x2),
                height: MediaQuery.sizeOf(context).height * 0.84,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.images.container.path),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(SpacingUnit.x4),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                          color: colors.background.withOpacity(0.3))
                    ]),
                child: Column(
                  children: [
                    BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
                      builder: (context, state) {
                        return CurrentCoin(
                          coin: state.fselCoin,
                        );
                      },
                    ),
                    const SizedBox(height: SpacingUnit.x2),
                    initScreen == MarketType.spaceShip
                        ? MarketSpaceships(
                            initScreen: initScreen,
                          )
                        : MarketCharacters(
                            initScreen: initScreen,
                          ),
                    const SizedBox(height: SpacingUnit.x3_5),
                    Container(
                      padding: const EdgeInsets.only(top: SpacingUnit.x1_5),
                      child: Row(
                        children: MarketType.values.map((e) {
                          return Expanded(
                              child: ButtonRectangle(
                            isEnabled: e == initScreen,
                            imageBackground: _buttonBackground(e),
                            title: e.name,
                            fontStyle: FontStyle.italic,
                            onPress: () {
                              _changeScreen(e);
                            },
                            titleColor: _buttonColor(colors, e),
                          ));
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
              const BoxShape(),
              const BoxShape(
                rotate: 2,
                isTop: true,
              )
            ])
          ]),
        ),
        BlocBuilder<StatusBuyBloc, StatusBuyState>(
          builder: (context, state) {
            if (state.status == StatusBuy.success && state.showSnackBar) {
              return CustomSnackBar(
                title: 'Nhà tài phiệt cấp vũ trụ',
                content: 'Tiêu ${state.price} FSEL Coin',
                onPress: hideSnackbar,
              );
            }
            return const SizedBox();
          },
        )
      ]),
    );
  }
}

class BoxShape extends StatelessWidget {
  final int rotate;
  final bool isTop;
  const BoxShape({super.key, this.rotate = 0, this.isTop = false});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: isTop ? 0 : null,
      bottom: !isTop ? 0 : null,
      left: MediaQuery.sizeOf(context).width * 0.33,
      child: RotatedBox(
        quarterTurns: rotate,
        child: Container(
          width: SpacingUnit.x35,
          height: SpacingUnit.x4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.images.bottomShape.path),
                  fit: BoxFit.fitWidth)),
        ),
      ),
    );
  }
}

class CurrentCoin extends StatelessWidget {
  final int coin;
  const CurrentCoin({super.key, this.coin = 0});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: SpacingUnit.x4, vertical: SpacingUnit.x3),
      width: double.infinity,
      decoration: BoxDecoration(
          color: colors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(SpacingUnit.x2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.images.coin4.path),
          const SizedBox(width: SpacingUnit.x2),
          ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: colors.gradientSoda)
                      .createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
              child: Text(
                coin.toString(),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              )),
        ],
      ),
    );
  }
}
