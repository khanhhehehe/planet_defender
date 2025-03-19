import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/data/models/enums/game_play_screens_type.dart';
import 'package:planet_defender/data/models/enums/z_buff_types.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_bloc.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_state.dart';

class ZBuff extends StatefulWidget {
  final GamePlayScreensType type;
  final List<ZBuffType> listBuff;
  final VoidCallback? onChangeIntro;
  final bool isShowIntro;
  const ZBuff(
      {super.key,
      required this.listBuff,
      this.type = GamePlayScreensType.none,
      this.onChangeIntro,
      this.isShowIntro = false});

  @override
  State<ZBuff> createState() => _ZBuffState();
}

class _ZBuffState extends State<ZBuff> {
  bool isShow = false;
  double opacityLevel = 0;

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 1 ? 0 : 1;
    });
  }

  void onPress() {
    if (widget.type != GamePlayScreensType.gameButtonSkill) {
      _changeOpacity();
      dI<BuffBloc>().add(const SetBuff(type: ZBuffType.unknown));
      setState(() {
        isShow = !isShow;
      });
    } else {
      dI<BuffBloc>().add(const AddBuff(type: ZBuffType.powerUp));
      widget.onChangeIntro?.call();
      _changeOpacity();
      setState(() {
        isShow = !isShow;
      });
    }
  }

  bool isGameButtonSkillScreen() {
    return widget.type == GamePlayScreensType.gameIntroSelectMeteorite &&
        isShow;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight =
        MediaQuery.sizeOf(context).height / 2.12 - SpacingUnit.x18;
    return Stack(
      alignment: Alignment.center,
      children: [
        ...widget.listBuff.mapIndexed(
          (index, element) {
            return AnimatedPositioned(
              top: isShow
                  ? getHeight(index, itemHeight)
                  : MediaQuery.sizeOf(context).height / 2.17,
              left: SpacingUnit.x2_5,
              duration: Duration(milliseconds: isShow ? 400 : 400),
              curve: Curves.easeInOut,
              width: SpacingUnit.x15,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x1),
                decoration: isGameButtonSkillScreen()
                    ? BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.images.highLight3.path)))
                    : null,
                child: AnimatedOpacity(
                  opacity: opacityLevel,
                  duration: Duration(milliseconds: index * 300),
                  child: GestureDetector(
                    onTap: () {
                      _changeOpacity();
                      dI<BuffBloc>().add(SetBuff(type: element));
                      setState(() {
                        isShow = !isShow;
                      });
                    },
                    child: Image.asset(
                      Assets.images.zStorageForm.path,
                      width: SpacingUnit.x14,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        ...widget.listBuff.mapIndexed(
          (index, element) {
            return AnimatedPositioned(
              top: isShow
                  ? getHeight(index, itemHeight) +
                      MediaQuery.sizeOf(context).height / 100
                  : MediaQuery.sizeOf(context).height / 2.17,
              left: SpacingUnit.x5,
              duration: Duration(milliseconds: isShow ? 400 : 400),
              curve: Curves.easeInOut,
              width: SpacingUnit.x10,
              child: AnimatedOpacity(
                opacity: opacityLevel,
                duration: Duration(milliseconds: index * 300),
                child: GestureDetector(
                  onTap: () {
                    _changeOpacity();
                    dI<BuffBloc>().add(SetBuff(type: element));
                    setState(() {
                      isShow = !isShow;
                    });
                    if (widget.isShowIntro && widget.onChangeIntro != null) {
                      widget.onChangeIntro!.call();
                    }
                  },
                  child: Center(
                    child: Image.asset(
                      element.pathImage,
                      width: SpacingUnit.x14,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          left: 2,
          top: MediaQuery.sizeOf(context).height / 2.16,
          child: BlocBuilder<BuffBloc, BuffState>(
            builder: (context, state) {
              return InkWell(
                  onTap: () => onPress(),
                  child: state.zBuffType == ZBuffType.unknown
                      ? Padding(
                          padding: const EdgeInsets.only(left: SpacingUnit.x2),
                          child: Image.asset(
                            Assets.images.zStorage.path,
                            width: SpacingUnit.x15,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: SpacingUnit.x2),
                          child: Stack(
                            children: [
                              Image.asset(
                                Assets.images.zStorageSelectForm.path,
                                width: SpacingUnit.x15,
                              ),
                              Positioned(
                                top: SpacingUnit.x3,
                                left: SpacingUnit.x2_5,
                                child: Image.asset(
                                  state.zBuffType.pathImage,
                                  width: SpacingUnit.x10,
                                ),
                              ),
                            ],
                          ),
                        ));
            },
          ),
        ),
      ],
    );
  }
}

double getHeight(int index, double itemHeight) {
  switch (index) {
    case 0:
      return itemHeight;
    case 1:
      return itemHeight / 1.23;
    case 2:
      return itemHeight / 1.6;
    case 3:
      return itemHeight / 2.3;
    default:
      return itemHeight;
  }
}
