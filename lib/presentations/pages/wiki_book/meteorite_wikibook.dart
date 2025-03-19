import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/meteorite/wiki_meteorite_bloc.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/meteorite/wiki_meteorite_state.dart';
import 'package:planet_defender/presentations/pages/wiki_book/item_wikibook.dart';

class MeteoriteWikibook extends StatelessWidget {
  final ValueChanged<dynamic> selectItem;
  const MeteoriteWikibook({super.key, required this.selectItem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.71,
      width: double.infinity,
      child: BlocBuilder<WikiMeteoriteBloc, WikiMeteoriteState>(
        builder: (context, state) {
          return GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: SpacingUnit.x2,
              mainAxisSpacing: SpacingUnit.x2,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              childAspectRatio: 0.84,
              children: List.generate(state.meteorites.values.length, (index) {
                final e = state.meteorites.values.elementAt(index);
                return ItemWikiBook(
                  index: index,
                  name: e.type.name,
                  image: e.image,
                  onSelect: () => selectItem((e)),
                  onSelectIndex: (value) {},
                );
              }));
        },
      ),
    );
  }
}
