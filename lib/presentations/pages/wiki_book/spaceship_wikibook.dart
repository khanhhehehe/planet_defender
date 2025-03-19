import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/space_ship/wiki_spaceship_bloc.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/space_ship/wiki_spaceship_state.dart';
import 'package:planet_defender/presentations/pages/wiki_book/item_wikibook.dart';

class SpaceshipWikibook extends StatelessWidget {
  final ValueChanged<dynamic> selectItem;
  final ValueChanged<int> selectIndex;
  const SpaceshipWikibook(
      {super.key, required this.selectItem, required this.selectIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.71,
      width: double.infinity,
      child: BlocBuilder<WikiSpaceshipsBloc, WikiSpaceshipState>(
        builder: (context, state) {
          return GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: SpacingUnit.x2,
              mainAxisSpacing: SpacingUnit.x2,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              childAspectRatio: 0.84,
              children: List.generate(state.spaceShips.values.length, (index) {
                final e = state.spaceShips.values.elementAt(index);
                return ItemWikiBook(
                  index: index,
                  name: e.name,
                  image: e.image,
                  isLock: !e.isOwned,
                  onSelect: () => selectItem((e)),
                  onSelectIndex: selectIndex,
                );
              }));
        },
      ),
    );
  }
}
