import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroducingCharacterSelection extends StatelessWidget {
  const IntroducingCharacterSelection({
    super.key,
    this.isSelectCosmo = false,
    this.pathNameCosmo = '',
    this.pathNameZina = '',
    this.textSkip = '',
    this.pathArrowRight = '',
    this.pathRobot = '',
    this.pathTextDialog = '',
  });
  final bool isSelectCosmo;
  final String pathNameCosmo;
  final String pathNameZina;

  final String textSkip;
  final String pathRobot;
  final String pathTextDialog;
  final String pathArrowRight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFF00255C), Color.fromARGB(0, 0, 37, 92)],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter),
            image: DecorationImage(
                image: AssetImage(isSelectCosmo ? pathNameCosmo : pathNameZina),
                fit: BoxFit.fill),
          ),
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  pathRobot,
                  width: SpacingUnit.x35,
                  height: SpacingUnit.x49,
                ),
              ),
              Column(
                children: [
                  const Expanded(child: SizedBox()),
                  Stack(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: SvgPicture.asset(
                                pathTextDialog,
                                height: SpacingUnit.x65,
                                fit: BoxFit.fill,
                              )),
                          Positioned(
                              top: 22,
                              right: SpacingUnit.x4,
                              child: GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: SpacingUnit.x10,
                                  width: SpacingUnit.x25_5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(textSkip,
                                          style: theme.textTheme.labelLarge!
                                              .copyWith(
                                            color: const Color(0xFF9FAACC),
                                            fontWeight: FontWeight.w600,
                                          )),
                                      const SizedBox(
                                        width: SpacingUnit.x2,
                                      ),
                                      Image.asset(pathArrowRight)
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
