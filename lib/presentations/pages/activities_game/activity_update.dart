import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:planet_defender/presentations/bloc/activities/activities_bloc.dart';
import 'package:planet_defender/presentations/bloc/activities/activities_state.dart';
import 'package:planet_defender/presentations/pages/activities_game/activities_game.page.dart';
import 'package:planet_defender/presentations/pages/activities_game/item_activity.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  String _formatDate(DateTime? date) {
    if (date != null) {
      return DateFormat('dd.MM.yyyy hh:mm').format(date);
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesBloc, ActivitiesState>(
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final e = state.events.values.elementAt(index);
              if (e.type == Events.update.name) {
                return ItemActivity(
                  title: e.title,
                  image: e.filePath,
                  date: _formatDate(e.startDate),
                  description: e.description,
                  isShowDescription: indexSelected == index,
                  onPress: () {
                    setState(() {
                      selectItem(index);
                    });
                  },
                );
              }
              return const SizedBox();
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: SpacingUnit.x4,
                ),
            itemCount: state.events.values.length);
      },
    );
  }
}
