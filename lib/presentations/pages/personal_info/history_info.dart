import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/item_diary.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> titles = ['Round', 'Score', 'Date'];

class HistoryInfo extends StatefulWidget {
  const HistoryInfo({super.key});

  @override
  State<HistoryInfo> createState() => _HistoryInfoState();
}

class _HistoryInfoState extends State<HistoryInfo> {
  int numSelected = -1;
  void _itemSelected(int i) {
    setState(() {
      numSelected = (i == numSelected) ? -1 : i;
    });
  }

  List<String> titles = ['Round', 'Score', 'Date'];
  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: SpacingUnit.x26_5),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: SpacingUnit.x6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
                child: Row(
                  children: [
                    const Spacer(),
                    for (int i = 0; i < titles.length; i++)
                      Expanded(
                          flex: i == titles.length - 1 ? 2 : 1,
                          child: Center(
                            child: Text(titles[i],
                                style: TextStyle(
                                    fontSize: SpacingUnit.x3_5,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w800,
                                    color: colors.surfaceContainerLow)),
                          )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SpacingUnit.x5),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
                itemCount: state.gameHistory.values.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ItemDiary(
                        gameHistory: state.gameHistory.values.toList(),
                        index: index,
                        onSelected: _itemSelected,
                        isSelected: numSelected == index ? true : false),
                    const SizedBox(height: SpacingUnit.x2_5)
                  ],
                ),
              ),
            ),
            const SizedBox(height: SpacingUnit.x6)
          ],
        );
      },
    );
  }
}
