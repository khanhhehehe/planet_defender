import 'package:audioplayers/audioplayers.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/border/border_select_item_intro.dart';
import 'package:base_widgets/key_board/keyboard.dart';
import 'package:base_widgets/key_board/select_skill.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/data/models/enums/check_answer_type.dart';
import 'package:planet_defender/data/models/questions_model.dart';
import 'package:planet_defender/domain/entities/questions.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/key_board/keyboard_bloc.dart';
import 'package:planet_defender/presentations/bloc/key_board/keyboard_state.dart';

final rows = [3, 10];

class FormQuestQuestion extends StatefulWidget {
  final String imageBackground;
  final String imageBackgroundMedia;
  final String imageBackgroundQuest;
  final String formFire;
  final String buttonEnter;
  final VoidCallback enter;
  final bool showQuest;
  final Questions questionData;
  final ValueChanged<String>? onChange;
  final bool introMedia;
  final bool introHint;
  final bool isAnalysisBoard;
  final bool isIntroContainer;
  final bool isIntroFire;
  final bool isIntroButtonSkill;
  final bool isFire;
  final VoidCallback? onCloseIntroBtnSkill;
  final bool introSkillItem;
  final bool autoSelectItem;
  final bool isSelectCancel;
  final CheckAnswerType answerSuccess;
  final VoidCallback? onCancel;
  final TextEditingController controller;
  final bool isIntroNextQuestion;

  const FormQuestQuestion({
    super.key,
    required this.questionData,
    required this.imageBackground,
    required this.imageBackgroundMedia,
    required this.imageBackgroundQuest,
    required this.formFire,
    required this.buttonEnter,
    required this.enter,
    this.showQuest = true,
    this.onChange,
    this.isIntroFire = false,
    this.introMedia = false,
    this.introHint = false,
    this.isAnalysisBoard = false,
    this.isIntroContainer = false,
    this.isFire = false,
    this.isIntroButtonSkill = false,
    this.onCloseIntroBtnSkill,
    this.introSkillItem = false,
    this.autoSelectItem = false,
    this.isSelectCancel = false,
    this.onCancel,
    this.answerSuccess = CheckAnswerType.init,
    required this.controller,
    this.isIntroNextQuestion = false,
  });

  @override
  State<FormQuestQuestion> createState() => _FormQuestQuestionState();
}

class _FormQuestQuestionState extends State<FormQuestQuestion> {
  bool isShowSkill = false;

  String getContent() {
    switch (widget.questionData.gameVocabType) {
      case GameVocabularyType.image:
        return "Please look at the image on the left and find the hidden keyword";
      case GameVocabularyType.audio:
        return "Press the play button on the left to listen to the keyword suggestion recording";
      default:
        return widget.questionData.questionContent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x1),
            height: widget.showQuest
                ? MediaQuery.of(context).size.height / 2.2
                : MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imageBackground),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: SpacingUnit.x2,
                ),
                if (widget.showQuest == true)
                  CustomPaint(
                    painter: widget.introMedia ? BorderSelectItem() : null,
                    child: Padding(
                      padding: const EdgeInsets.all(SpacingUnit.x1),
                      child: Row(
                        children: [
                          Expanded(
                            flex: rows[0],
                            child: GestureDetector(
                              onTap: () {
                                if (widget.questionData.gameVocabType ==
                                    GameVocabularyType.image) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DialogShowImage(
                                          srcImage: widget
                                              .questionData.questionContent,
                                        );
                                      });
                                }
                              },
                              child: CustomPaint(
                                painter: widget.introHint
                                    ? BorderSelectItem()
                                    : null,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: SpacingUnit.x0_5,
                                      horizontal: SpacingUnit.x1),
                                  height:
                                      MediaQuery.sizeOf(context).width / 4.6,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(widget
                                                  .questionData.gameVocabType ==
                                              GameVocabularyType.none
                                          ? Assets.images.media.path
                                          : widget.answerSuccess ==
                                                  CheckAnswerType.success
                                              ? Assets.images.mediaEmptySs.path
                                              : widget.answerSuccess ==
                                                      CheckAnswerType.fail
                                                  ? Assets.images.mediaEmptyFail
                                                      .path
                                                  : Assets
                                                      .images.mediaEmty.path),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: Center(
                                    child: ClipPath(
                                      clipper: CustomClipPath(),
                                      child:
                                          widget.questionData.gameVocabType ==
                                                  GameVocabularyType.none
                                              ? null
                                              : _getContentType(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: SpacingUnit.x1_5,
                          ),
                          Expanded(
                            flex: rows[1],
                            child: Material(
                              color: Colors.transparent,
                              child: CustomPaint(
                                painter: widget.isAnalysisBoard
                                    ? BorderSelectItem()
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(SpacingUnit.x1),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 4.5,
                                    padding:
                                        const EdgeInsets.all(SpacingUnit.x2),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              widget.imageBackgroundQuest),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Text(getContent()),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                Expanded(
                  child: isShowSkill == false
                      ? BlocBuilder<KeyboardBloc, KeyboardState>(
                          buildWhen: (previous, current) =>
                              previous.value != current.value,
                          builder: (context, state) {
                            return KeyBoard(
                              controller: widget.controller,
                              isFire: widget.isFire,
                              isIntroFire: widget.isIntroFire,
                              showQuest: widget.showQuest,
                              imageBackground: widget.imageBackground,
                              imageBackgroundMedia: widget.imageBackgroundMedia,
                              imageBackgroundQuest: widget.imageBackgroundQuest,
                              formFire: widget.formFire,
                              buttonEnter: widget.buttonEnter,
                              showSkill: () {
                                widget.onCloseIntroBtnSkill?.call();
                                setState(() {
                                  isShowSkill = !isShowSkill;
                                });
                              },
                              enter: () => widget.enter.call(),
                              onChange: (value) => {},
                              isIntroContainer: widget.isIntroContainer,
                              isIntroButtonSkill: widget.isIntroButtonSkill,
                              isSelectCancel: widget.isSelectCancel,
                              onCancel: () => widget.onCancel?.call(),
                              isIntroNextQuestion: widget.isIntroNextQuestion,
                            );
                          },
                        )
                      : SelectSkill(
                          introSkillItem: widget.introSkillItem,
                          onEnter: () {
                            widget.enter.call();
                          },
                          onGoKeyboard: () {
                            setState(() {
                              isShowSkill = !isShowSkill;
                            });
                          },
                          autoSelectItem: widget.autoSelectItem,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getContentType() {
    switch (widget.questionData.gameVocabType) {
      case GameVocabularyType.audio:
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.sizeOf(context).height,
          color: BaseThemeColor.of(context).surfaceContainerLow,
          child: AudioQuestion(url: widget.questionData.questionContent),
        );
      case GameVocabularyType.image:
        return Container(
          color: BaseThemeColor.of(context).surfaceContainerLow,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.sizeOf(context).height,
          child: Image.network(
            widget.questionData.questionContent,
            fit: BoxFit.cover,
          ),
        );
      case GameVocabularyType.hint:
        return Container(
          color: BaseThemeColor.of(context).surfaceContainerLow,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.sizeOf(context).height,
          child: Image.asset(
            Assets.images.word.path,
            fit: BoxFit.cover,
          ),
        );
      case GameVocabularyType.jumbledSpelling:
        return Container(
          color: BaseThemeColor.of(context).surfaceContainerLow,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.sizeOf(context).height,
          child: Image.asset(
            Assets.images.jumbled.path,
            fit: BoxFit.cover,
          ),
        );
      case GameVocabularyType.definition:
        return Container(
          color: BaseThemeColor.of(context).surfaceContainerLow,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.sizeOf(context).height,
          child: Image.asset(
            Assets.images.suggestion.path,
            fit: BoxFit.cover,
          ),
        );
      default:
        return Container(
          width: MediaQuery.of(context).size.width,
          color: BaseThemeColor.of(context).surfaceContainerLow,
        );
    }
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 4.4, size.height / 20);
    path.lineTo(size.width / 60, size.height / 4.1);
    path.lineTo(size.width / 60, size.height - size.height / 4.2);
    path.lineTo(size.width / 4.4, size.height - size.height / 18);
    path.lineTo(size.width / 4.4, size.height - size.height / 18);
    path.lineTo(size.width / 1.27, size.height - size.height / 18);
    path.lineTo(size.width / 1.01, size.height - size.height / 4.2);
    path.lineTo(size.width / 1.01, size.height / 4.1);
    path.lineTo(size.width / 1.27, size.height / 20);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class AudioQuestion extends StatefulWidget {
  final String url;
  const AudioQuestion({super.key, required this.url});
  @override
  State<AudioQuestion> createState() => _AudioQuestionState();
}

class _AudioQuestionState extends State<AudioQuestion> {
  bool isPlay = false;
  final player = AudioPlayer();
  Duration? duration = const Duration();

  @override
  void initState() {
    playAudio();
    super.initState();
  }

  Future<void> playAudio() async {
    setState(() {
      isPlay = true;
    });
    await player.play(UrlSource(widget.url));
    player.onPlayerComplete.listen((_) {
      setState(() {
        isPlay = false;
      });
    });
  }

  Future<void> pauseAudio() async {
    await player.pause();
    player.onPlayerComplete.listen((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        playAudio();
      },
      child: isPlay
          ? Image.asset(Assets.images.playAudio.path)
          : Image.asset(Assets.images.pauseAudio.path),
    );
  }
}

class DialogShowImage extends StatelessWidget {
  final String srcImage;
  const DialogShowImage({super.key, required this.srcImage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SpacingUnit.x1_5),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height / 4,
          child: Image.network(
            srcImage,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
