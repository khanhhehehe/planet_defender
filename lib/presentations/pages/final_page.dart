// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/common/utils/meteorite_utils.dart';
import 'package:planet_defender/data/models/enums/final_tab_type.dart';
import 'package:planet_defender/data/models/questions_model.dart';
import 'package:planet_defender/data/models/request/game_history_request.dart';
import 'package:planet_defender/domain/entities/student_answers.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/game_history/game_history_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_history/game_history_state.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:planet_defender/presentations/bloc/question/question_bloc.dart';
import 'package:planet_defender/presentations/bloc/user/user_bloc.dart';
import 'package:planet_defender/presentations/bloc/user/user_state.dart';
import 'package:planet_defender/presentations/pages/form_quest_question.dart';
import 'package:planet_defender/presentations/pages/personal_info/customize_dialog.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/dialog/content_dialog.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/personal_info.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/elevated_button.dart';
import 'package:base_widgets/labels/personal_info/uid.dart';
import 'package:base_widgets/molecules/personal_info/level_bar.dart';
import 'package:base_widgets/molecules/personal_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:localizations/l10n/app_localizations.dart';

final rows = [1, 1, 1];

final finalGamePlayPage = GoRoute(
    path: Pages.finalGamePlay,
    builder: (context, GoRouterState state) => const FinalGamePlay());

class FinalGamePlay extends StatefulWidget {
  const FinalGamePlay({super.key});
  @override
  State<FinalGamePlay> createState() => _FinalGamePlayState();
}

class _FinalGamePlayState extends State<FinalGamePlay> {
  @override
  void initState() {
    dI<UserBloc>().add(const GetUserInfo());
    String studentId = dI<UserBloc>().state.userInfo.studentId;
    dI<PersonalInfoBloc>().add(InitPersonalInfo(studentId: studentId));
    dI<GameHistoryBloc>().add(const GetGameHistory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        builder: (context, state) {
          return LayoutPersonalInfo(
            isShowActionButton: false,
            isFinalPage: true,
            onClose: () {},
            onChangeScreen: (item) {},
            child: state.tabType == FinalTabType.finalize
                ? const FinalizePage()
                : const RevisionPage(),
          );
        },
      ),
    );
  }
}

class ItemTotalFinalGamePlay extends StatelessWidget {
  final String title;
  final String value;
  const ItemTotalFinalGamePlay(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: colors.surfaceContainerLow.withOpacity(0.2),
          borderRadius:
              const BorderRadius.all(Radius.circular(SpacingUnit.x2))),
      child: Column(
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium!.copyWith(
              color: colors.textSecondary,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.titleLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class DetailTotalFinalGamePlay extends StatelessWidget {
  final String title;
  final String value;
  const DetailTotalFinalGamePlay(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Container(
      width: MediaQuery.sizeOf(context).width / 4,
      height: MediaQuery.sizeOf(context).width / 4,
      decoration: BoxDecoration(
          color: colors.surfaceContainerLow.withOpacity(0.15),
          borderRadius:
              const BorderRadius.all(Radius.circular(SpacingUnit.x2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: colors.textSecondary,
            ),
          ),
          Image.asset(
            Assets.images.galaxy.path,
            width: SpacingUnit.x10,
          ),
          Text(
            value,
            style: theme.textTheme.titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ActionFinalPage extends StatelessWidget {
  const ActionFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 4,
          ),
          btnIcon(Icons.home, context, onTap: () {
            dI<GameHistoryBloc>().add(const ResetGameHistory());
            dI<AppNavigation>().popUtil(context, Pages.home);
          }),
          btnIcon(Icons.storage_outlined, context),
          btnIcon(Icons.share, context),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 3,
            height: SpacingUnit.x9,
            child: AppElevatedButton(
              onContinue: () {
                playAgain(context);
                backGamePlay(context);
              },
              isEnabled: true,
              textButton: 'Play again',
            ),
          ),
        ],
      ),
    );
  }

  Future<void> playAgain(BuildContext context) async {
    Completer completerInit = Completer<bool>();
    dI<QuestionBloc>().add(InitQuestions(completer: completerInit));
    await completerInit.future;
    Completer completer = Completer<GameHistoryStatus>();
    dI<GameHistoryBloc>().add(SaveGameHistory(
        gameHistoryRequest: GameHistoryRequest(), completer: completer));
    GameHistoryStatus status = await completer.future;
    if (status == GameHistoryStatus.success) {
      dI<GameHistoryBloc>().add(const InitGameHistory());
      dI<QuestionBloc>().add(const GetTimeConfig());
    }
  }

  void backGamePlay(BuildContext context) {
    dI<AppNavigation>().replace(context, page: Pages.gamePlay);
  }

  Widget btnIcon(IconData icon, BuildContext context, {VoidCallback? onTap}) {
    final colors = BaseThemeColor.of(context);
    return InkWell(
      onTap: () => onTap?.call(),
      child: Container(
        decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius:
                const BorderRadius.all(Radius.circular(SpacingUnit.x1))),
        width: SpacingUnit.x9,
        height: SpacingUnit.x9,
        child: Icon(
          icon,
          size: SpacingUnit.x8,
          color: Colors.white,
        ),
      ),
    );
  }
}

class RevisionPage extends StatefulWidget {
  const RevisionPage({super.key});

  @override
  State<RevisionPage> createState() => _RevisionPageState();
}

class _RevisionPageState extends State<RevisionPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<GameHistoryBloc, GameHistoryState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: SpacingUnit.x11),
            child: ListView.builder(
              itemCount: state.gameHistory.studentAnswers.length,
              itemBuilder: (context, index) {
                final item = state.gameHistory.studentAnswers[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: SpacingUnit.x4, vertical: SpacingUnit.x2),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: Color(0xFF252E4C),
                    borderRadius:
                        BorderRadius.all(Radius.circular(SpacingUnit.x4)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: SpacingUnit.x3,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                item.isCorrect ? colors.success : colors.error,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(SpacingUnit.x4)),
                          ),
                          width: SpacingUnit.x25,
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              MeteoriteUtils()
                                  .getTitleGameVocabTypePath(item.type),
                              height: SpacingUnit.x8,
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: SpacingUnit.x3),
                          width: MediaQuery.sizeOf(context).width,
                          height: SpacingUnit.x45,
                          decoration: BoxDecoration(
                            color: colors.surfaceContainerLowest,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(SpacingUnit.x4)),
                          ),
                          child: item.type == GameVocabularyType.image
                              ? Image.network(
                                  item.questionContent,
                                  fit: BoxFit.cover,
                                )
                              : item.type == GameVocabularyType.audio
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.sizeOf(context).height,
                                      color: BaseThemeColor.of(context)
                                          .surfaceContainerLow,
                                      child: AudioQuestion(
                                          url: item.questionContent),
                                    )
                                  : Padding(
                                      padding:
                                          const EdgeInsets.all(SpacingUnit.x3),
                                      child: Text(
                                        item.questionContent,
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                        ),
                        const SizedBox(
                          height: SpacingUnit.x3,
                        ),
                        if (item.isCorrect == false) ...[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: colors.error),
                              color: colors.surfaceContainerLowest,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(SpacingUnit.x2)),
                            ),
                            width: MediaQuery.sizeOf(context).width,
                            height: 50,
                            child: Center(
                              child: Text(
                                item.answer,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colors.error),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: SpacingUnit.x3,
                          ),
                        ],
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF2EE5A8)),
                            color: colors.surfaceContainerLowest,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(SpacingUnit.x2)),
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          height: 50,
                          child: Center(
                            child: Text(
                              item.key,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2EE5A8)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: SpacingUnit.x4,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class FinalizePage extends StatefulWidget {
  const FinalizePage({super.key});

  @override
  State<FinalizePage> createState() => _FinalizePageState();
}

class _FinalizePageState extends State<FinalizePage> {
  double _expBar(int exp, int totalExp) {
    return exp / (totalExp == 0 ? 1 : totalExp);
  }

  int _getRightAnswer(List<StudentAnswers> data) {
    final list = data.where((e) => e.isCorrect == true).toList();
    return list.length;
  }

  int _getWrongAnswer(List<StudentAnswers> data) {
    final list = data.where((e) => e.isCorrect == false).toList();
    return list.length;
  }

  Future<void> _showCustomizeDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomizeDialog(
              title: "Customize",
              backgroundImage: Assets.images.bgCustomizeDialog.path,
              children: const [
                ContentDialog(),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
          builder: (context, stateInfo) {
            return BlocBuilder<GameHistoryBloc, GameHistoryState>(
              builder: (context, gameHistoryState) {
                return SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(height: SpacingUnit.x26_5),
                    AppLabelUID(
                      icon: Assets.images.copy.path,
                      onCopy: () {},
                      userId: stateInfo.code,
                      titleFsel: appLocalizations.fsel,
                      accountType: stateInfo.accountType,
                    ),
                    const SizedBox(height: SpacingUnit.x4),
                    UserInfo(
                      image: Assets.images.cosmo.path,
                      backgroundAvatar: Assets.images.patterns.path,
                      userName: state.userInfo.nickName,
                      role: state.userInfo.tagName,
                      onPress: () => _showCustomizeDialog(context),
                    ),
                    const SizedBox(height: SpacingUnit.x4),
                    AppLevelBar(
                      levelFrom: state.userInfo.level.toString(),
                      levelTo: (state.userInfo.level + 1).toString(),
                      levelPercent: _expBar(stateInfo.exp, stateInfo.totalExp),
                    ),
                    const SizedBox(height: SpacingUnit.x8),
                    const ActionFinalPage(),
                    const SizedBox(height: SpacingUnit.x8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SpacingUnit.x4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Assets.images.lineFinalPage1.path,
                            width: MediaQuery.sizeOf(context).width / 4,
                          ),
                          Text(
                            "TỔNG KẾT",
                            style: theme.textTheme.titleLarge!.copyWith(
                                color: colors.textSecondary,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(Assets.images.lineFinalPage.path,
                              width: MediaQuery.sizeOf(context).width / 4)
                        ],
                      ),
                    ),
                    const SizedBox(height: SpacingUnit.x8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SpacingUnit.x4),
                      width: MediaQuery.sizeOf(context).width,
                      child: ItemTotalFinalGamePlay(
                        title: 'Điểm cao nhất',
                        value: gameHistoryState.gameHistory.score.toString(),
                      ),
                    ),
                    const SizedBox(height: SpacingUnit.x4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SpacingUnit.x4),
                      child: Row(
                        children: [
                          Expanded(
                            flex: rows[0],
                            child: SizedBox(
                              child: DetailTotalFinalGamePlay(
                                title: 'Số vòng đấu',
                                value: gameHistoryState.gameHistory.roundNumber
                                    .toString(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: SpacingUnit.x3,
                          ),
                          Expanded(
                            flex: rows[1],
                            child: SizedBox(
                              child: DetailTotalFinalGamePlay(
                                title: 'Trả lời đúng',
                                value: _getRightAnswer(gameHistoryState
                                        .gameHistory.studentAnswers)
                                    .toString(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: SpacingUnit.x3,
                          ),
                          Expanded(
                            flex: rows[2],
                            child: SizedBox(
                              child: DetailTotalFinalGamePlay(
                                title: 'Trả lời sai',
                                value: _getWrongAnswer(gameHistoryState
                                        .gameHistory.studentAnswers)
                                    .toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: SpacingUnit.x3,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SpacingUnit.x4),
                      child: Row(
                        children: [
                          Expanded(
                            flex: rows[0],
                            child: SizedBox(
                              child: DetailTotalFinalGamePlay(
                                title: 'FSEL Coin',
                                value: gameHistoryState
                                    .gameHistory.numberOfToken
                                    .toString(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: SpacingUnit.x3,
                          ),
                          Expanded(
                            flex: rows[1],
                            child: SizedBox(
                              child: DetailTotalFinalGamePlay(
                                title: 'Streak',
                                value: gameHistoryState.gameHistory.comboNumber
                                    .toString(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: SpacingUnit.x3,
                          ),
                          Expanded(
                            flex: rows[2],
                            child: SizedBox(
                              child: DetailTotalFinalGamePlay(
                                title: 'Z matter',
                                value: gameHistoryState
                                    .gameHistory.zPlanetNumber
                                    .toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                );
              },
            );
          },
        );
      },
    );
  }
}
