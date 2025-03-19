// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/character_type.dart';
import 'package:planet_defender/data/models/enums/level_type.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/character/character_bloc.dart';
import 'package:planet_defender/presentations/bloc/character/character_state.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/models/button_content_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const rows = [1, 1];

// ignore: must_be_immutable
class LevelSettingAcademicAndIelts extends StatefulWidget {
  LevelSettingAcademicAndIelts({
    super.key,
    this.listContentButtons = const [],
    this.isSelectCosmo = false,
    this.pathNameCosmo = '',
    this.pathNameZina = '',
    this.pathDisabledLeft = '',
    this.pathDisabledRight = '',
    this.pathEnabledLeft = '',
    this.pathEnabledRight = '',
    this.isEnabledAcademic = true,
    this.pathBeveledBox = '',
    this.titleAcademic = '',
    this.titleButtonStart = '',
    this.titleIelts = '',
    this.items = const [],
    required this.character,
    this.onPress,
  });

  final List<ButtonContentModel> listContentButtons;
  final CharacterType character;
  final bool isSelectCosmo;
  final String pathDisabledLeft;
  final String pathDisabledRight;
  final String pathEnabledLeft;
  final String pathEnabledRight;
  final String pathNameCosmo;
  final String pathNameZina;
  final String pathBeveledBox;
  final String titleButtonStart;
  final String titleAcademic;
  final String titleIelts;
  final List<String> items;
  final VoidCallback? onPress;

  bool isEnabledAcademic;
  @override
  State<LevelSettingAcademicAndIelts> createState() =>
      _LevelSettingAcademicAndIeltsState();
}

class _LevelSettingAcademicAndIeltsState
    extends State<LevelSettingAcademicAndIelts> {
  int indexSelect = -1;
  bool isHidden = false;
  int indexContent = 0;

  @override
  void initState() {
    dI<CharacterBloc>().add(const SelectAcademic(type: AcademicType.unknown));
    dI<CharacterBloc>().add(const SelectIelts(type: IeltsType.unknown));
    dI<CharacterBloc>().add(const ChangeTab(type: SelectTabLevelType.academic));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<CharacterBloc, CharacterState>(
      buildWhen: (previous, current) =>
          previous.selectTabLevelType != current.selectTabLevelType,
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.pathBeveledBox),
                    fit: BoxFit.fill,
                  ),
                ),
                child: _Body(
                    titleButtonStart: widget.titleButtonStart,
                    onPress: () {
                      widget.onPress?.call();
                    }),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 2.24,
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: SpacingUnit.x3),
                child: Row(
                  children: [
                    Expanded(
                      flex: rows[0],
                      child: _ItemTab(
                          title: widget.titleAcademic,
                          textColor: state.selectTabLevelType ==
                                  SelectTabLevelType.academic
                              ? colors.onSecondary
                              : colors.surfaceDim,
                          onTap: () {
                            dI<CharacterBloc>().add(const ChangeTab(
                                type: SelectTabLevelType.academic));
                          },
                          background: state.selectTabLevelType ==
                                  SelectTabLevelType.academic
                              ? widget.pathEnabledLeft
                              : widget.pathDisabledLeft,
                          tooltipsContent: widget.items[1]),
                    ),
                    const SizedBox(
                      width: SpacingUnit.x3,
                    ),
                    Expanded(
                      flex: rows[1],
                      child: _ItemTab(
                          title: widget.titleIelts,
                          onTap: () {
                            dI<CharacterBloc>().add(const ChangeTab(
                                type: SelectTabLevelType.ielts));
                          },
                          textColor: state.selectTabLevelType ==
                                  SelectTabLevelType.ielts
                              ? colors.onSecondary
                              : colors.surfaceDim,
                          background: state.selectTabLevelType ==
                                  SelectTabLevelType.ielts
                              ? widget.pathEnabledRight
                              : widget.pathDisabledRight,
                          tooltipsContent: widget.items[1]),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

Widget showToolTip(Widget child, List<String> listContents, int indexContent,
    Color textColor, Color bgColor) {
  return Tooltip(
    message: listContents[indexContent],
    textStyle:
        TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: textColor),
    decoration: BoxDecoration(
        color: bgColor, borderRadius: BorderRadius.circular(SpacingUnit.x1)),
    child: child,
  );
}

class _ItemTab extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String background;
  final Color textColor;
  final String tooltipsContent;
  const _ItemTab(
      {this.title = '',
      required this.onTap,
      required this.background,
      required this.textColor,
      this.tooltipsContent = ''});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return InkWell(
      onTap: () => onTap.call(),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: SpacingUnit.x4,
                  fontWeight: FontWeight.w700,
                  color: textColor),
            ),
            const SizedBox(
              width: SpacingUnit.x1,
            ),
            Tooltip(
              richMessage: WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: SpacingUnit.x69),
                    child: Text(tooltipsContent,
                        style: theme.textTheme.labelSmall?.copyWith()),
                  )),
              padding: const EdgeInsets.symmetric(
                  horizontal: SpacingUnit.x4, vertical: SpacingUnit.x4),
              decoration: BoxDecoration(
                  color: colors.secondaryContainer,
                  borderRadius: BorderRadius.circular(SpacingUnit.x1)),
              child: Icon(
                Icons.info,
                color: textColor,
                size: SpacingUnit.x4_5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final String titleButtonStart;
  final VoidCallback? onPress;
  const _Body({required this.titleButtonStart, this.onPress});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        List list = state.selectTabLevelType == SelectTabLevelType.academic
            ? AcademicType.values
            : IeltsType.values;
        return Container(
          margin: const EdgeInsets.only(top: SpacingUnit.x15),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: SpacingUnit.x5),
                  itemCount: list.length - 1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        return _onTap(
                            selectTabLevelType: state.selectTabLevelType,
                            data: list[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: SpacingUnit.x2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: SpacingUnit.x3,
                            vertical: SpacingUnit.x3),
                        decoration: BoxDecoration(
                            image: (state.academicType == list[index] ||
                                    state.ieltsType == list[index])
                                ? DecorationImage(
                                    image: AssetImage(
                                        Assets.images.buttonSelectLevel.path),
                                    fit: BoxFit.fill)
                                : null),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: (state.academicType == list[index] ||
                                      state.ieltsType == list[index])
                                  ? SpacingUnit.x10
                                  : 0),
                          child: Text(
                            list[index].name,
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: (state.academicType == list[index] ||
                                        state.ieltsType == list[index])
                                    ? colors.onSurface
                                    : colors.surfaceContainer,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (state.academicType != AcademicType.unknown ||
                  state.ieltsType != IeltsType.unknown)
                ButtonStartGame(
                  title: titleButtonStart,
                  onPress: () {
                    onPress?.call();
                  },
                )
            ],
          ),
        );
      },
    );
  }

  void _onTap(
      {required SelectTabLevelType selectTabLevelType, required dynamic data}) {
    if (selectTabLevelType == SelectTabLevelType.academic) {
      dI<CharacterBloc>().add(SelectAcademic(type: data));
      dI<CharacterBloc>().add(const SelectIelts(type: IeltsType.unknown));
    }
    if (selectTabLevelType == SelectTabLevelType.ielts) {
      dI<CharacterBloc>().add(SelectIelts(type: data));
      dI<CharacterBloc>().add(const SelectAcademic(type: AcademicType.unknown));
    }
  }
}

class ButtonStartGame extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const ButtonStartGame(
      {super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: SpacingUnit.x6),
          height: SpacingUnit.x10,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpacingUnit.x1),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colors.gradientNavy),
              boxShadow: [
                BoxShadow(
                    color: colors.shadowButton,
                    blurRadius: 4,
                    offset: const Offset(0, 2))
              ]),
          child: TextButton(
            onPressed: () => onPress.call(),
            child: Text(
              title,
              style:
                  theme.textTheme.bodyLarge?.copyWith(color: colors.onPrimary),
            ),
          ),
        ),
        const SizedBox(
          height: SpacingUnit.x8,
        )
      ],
    );
  }
}
