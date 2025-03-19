import 'dart:async';

import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/button_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/countdown_time/countdown_time_bloc.dart';
import 'package:planet_defender/presentations/bloc/market_place/characters/characters_bloc.dart';
import 'package:planet_defender/presentations/bloc/market_place/spaceships/spaceships_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:planet_defender/presentations/bloc/status_buy/status_buy_bloc.dart';
import 'package:planet_defender/presentations/bloc/status_buy/status_buy_state.dart';
import 'package:planet_defender/presentations/pages/market_place/market_place.page.dart';
import 'package:planet_defender/presentations/pages/market_place/widgets/button_pay.dart';
import 'package:planet_defender/presentations/pages/setting_screen/widgets/dialog_success.dart';
class ItemMarketPlace extends StatefulWidget {
  final String image;
  final String name;
  final int coin;
  final String skin;
  final String description;
  final MarketType marketType;
  final String id;
  const ItemMarketPlace({
    super.key,
    this.image = '',
    this.name = '',
    this.coin = 0,
    this.skin = '',
    this.description = '',
    required this.marketType,
    required this.id,
  });

  @override
  State<ItemMarketPlace> createState() => _ItemMarketPlaceState();
}

class _ItemMarketPlaceState extends State<ItemMarketPlace> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return InkWell(
      onTap: () => _showDialog(
        context,
        image: widget.image,
        name: widget.name,
        coin: widget.coin,
        skin: widget.skin,
        description: widget.description,
        marketType: widget.marketType,
        id: widget.id,
      ),
      child: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: colors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(SpacingUnit.x2),
                    image: DecorationImage(
                        image: AssetImage(Assets.images.hexagonRound.path))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: SpacingUnit.x7),
                      Container(
                        height: SpacingUnit.x18,
                        width: SpacingUnit.x18,
                        decoration: BoxDecoration(
                            color: colors.surfaceDim,
                            borderRadius: BorderRadius.circular(SpacingUnit.x3),
                            image: DecorationImage(
                                image: AssetImage(widget.image))),
                      ),
                      const SizedBox(height: SpacingUnit.x2),
                      Text(
                        widget.name,
                        style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.onSurface),
                      )
                    ]),
              )),
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.borderPrice.path),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(SpacingUnit.x2)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.coin4.path,
                    width: SpacingUnit.x3_5,
                    height: SpacingUnit.x3_5,
                  ),
                  const SizedBox(width: SpacingUnit.x1),
                  Text(widget.coin.toString(),
                      style: const TextStyle(
                          fontSize: SpacingUnit.x3_5,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic)),
                ]),
          )),
        ],
      ),
    );
  }
}

Future<dynamic> _showDialog(
  BuildContext contextDialog, {
  String image = '',
  String name = '',
  int coin = 0,
  String skin = '',
  String description = '',
  required MarketType marketType,
  int time = 0,
  required String id,
}) =>
    showDialog(
        context: contextDialog,
        builder: (contextDialogSuccess) {
          final theme = Theme.of(contextDialogSuccess);
          final colors = BaseThemeColor.of(contextDialogSuccess);
          return ClipRRect(
            borderRadius: BorderRadius.circular(SpacingUnit.x3),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SpacingUnit.x3)),
              child: Container(
                height: MediaQuery.sizeOf(contextDialogSuccess).height * 0.7,
                padding: const EdgeInsets.all(SpacingUnit.x4),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SpacingUnit.x3),
                    image: DecorationImage(
                        image: AssetImage(Assets.images.popup.path),
                        fit: BoxFit.fill)),
                child: Column(children: [
                  Expanded(
                      child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: SpacingUnit.x9,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              color: colors.textLight),
                        ),
                        Text(
                          skin,
                          style: TextStyle(
                              fontSize: SpacingUnit.x3_5,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              color: colors.textLight),
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: colors.surfaceDim,
                            borderRadius:
                                BorderRadius.circular(SpacingUnit.x7_5),
                            image: DecorationImage(image: AssetImage(image))),
                      )),
                  const SizedBox(height: SpacingUnit.x3),
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                marketType == MarketType.spaceShip
                                    ? "[Skill]"
                                    : "[Tiều sử]",
                                style: theme.textTheme.labelLarge?.copyWith(
                                    color: colors.textDark,
                                    fontWeight: FontWeight.w600)),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Text(
                                  description,
                                  style: theme.textTheme.labelLarge?.copyWith(
                                      color: colors.textSecondary,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(height: SpacingUnit.x3),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
                          builder: (context, state) {
                            return ButtonPay(
                              coin: coin,
                              onPress: () {
                                if (state.fselCoin > coin) {
                                  _buyItem(marketType: marketType, id: id);
                                  dI<StatusBuyBloc>()
                                      .add(SetPrice(price: coin));
                                  _buyItemSuccess(
                                    context: contextDialogSuccess,
                                    contextDialog: contextDialog,
                                    name: name,
                                    time: time,
                                  );
                                }
                              },
                            );
                          },
                        ),
                        ButtonClose(
                          child: Icon(Icons.close, color: colors.textSecondary),
                          onPress: () => dI<AppNavigation>().pop(contextDialogSuccess),
                        ),
                      ])),
                ]),
              ),
            ),
          );
        });
void _buyItemSuccess({
  required BuildContext context,
  required BuildContext contextDialog,
  required String name,
  int time = 0,
}) {
  dI<AppNavigation>().pop(context);
  if (dI<StatusBuyBloc>().state.status == StatusBuy.success) {
    successful(
      context: context,
      title: "Success",
      content: "Chúc mừng bạn đã sở hữu $name\nSử dụng ngay thôi nào!",
      textButton: "Trở lại ",
      onPress: () {
        if (dI<CountdownTimeBloc>().state.executionTime == 0) {
          dI<AppNavigation>().pop(contextDialog);
          dI<StatusBuyBloc>()
              .add(const ChangeStatusShowSnackBar(statusSnackBar: true));
        }
      },
    );
  }
}

void _buyItem({required MarketType marketType, required String id}) {
  if (marketType == MarketType.spaceShip) {
    dI<SpaceshipsBloc>().add(BuySpaceship(spaceShip: id));
  } else {
    dI<CharactersBloc>().add(BuyCharacter(characterId: id));
  }
  dI<CountdownTimeBloc>().add(const SetExecutionTime(seconds: 4));
}
