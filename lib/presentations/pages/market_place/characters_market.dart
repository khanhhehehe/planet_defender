import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/presentations/bloc/market_place/characters/characters_bloc.dart';
import 'package:planet_defender/presentations/bloc/market_place/characters/characters_state.dart';
import 'package:planet_defender/presentations/pages/market_place/item_market.dart';
import 'package:planet_defender/presentations/pages/market_place/market_place.page.dart';

class MarketCharacters extends StatelessWidget {
  const MarketCharacters({
    super.key,
    required this.initScreen,
  });

  final MarketType initScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.66,
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          return GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              crossAxisSpacing: SpacingUnit.x2,
              mainAxisSpacing: SpacingUnit.x2,
              shrinkWrap: true,
              childAspectRatio: 0.85,
              children: List.generate(state.characters.values.length, (index) {
                final e = state.characters.values.elementAt(index);
                return ItemMarketPlace(
                  image: e.image,
                  name: e.code,
                  coin: e.price,
                  skin: e.name,
                  description: e.description,
                  marketType: initScreen,
                  id: e.id,
                );
              }));
        },
      ),
    );
  }
}
