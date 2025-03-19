import 'package:base_themes/base_color.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppLevelBar extends StatelessWidget {
  final String levelFrom;
  final String levelTo;
  final double levelPercent;
  const AppLevelBar(
      {super.key,
      required this.levelFrom,
      required this.levelTo,
      required this.levelPercent});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
      child: SizedBox(
        height: SpacingUnit.x10,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: _LeftBar(),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: colors.gradientBlueLight)),
                width: SpacingUnit.x12_5,
                child: Center(
                    child: Text(
                  levelFrom,
                  style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700, color: colors.textDark),
                )),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  ClipPath(
                    clipper: _BaseCenterBarBase(),
                    child: Container(
                      color: colors.onSurface,
                    ),
                  ),
                  ClipPath(
                    clipper: _CenterBar(),
                    child: Container(
                      width: (MediaQuery.of(context).size.width -
                              SpacingUnit.x33) *
                          levelPercent,
                      decoration: BoxDecoration(
                          gradient:
                              LinearGradient(colors: colors.gradientBlueLight)),
                    ),
                  ),
                ]),
              ),
            ),
            ClipPath(
              clipper: _RightBar(),
              child: Container(
                decoration: BoxDecoration(
                    color: levelPercent == 1 ? null : colors.onSurface,
                    gradient: levelPercent == 1
                        ? LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: colors.gradientBlueLight)
                        : null),
                width: SpacingUnit.x12_5,
                child: Center(
                    child: Text(levelTo,
                        style: theme.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: levelPercent == 1
                                ? colors.textDark
                                : colors.textTertiary))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 4, size.height);
    path.lineTo(4, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _BaseCenterBarBase extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 2, 0);
    path.quadraticBezierTo(size.width - 0.5, 0.5, size.width, 2);
    path.lineTo(size.width - 4, size.height - 2);
    path.quadraticBezierTo(
        size.width - 4.5, size.height - 0.5, size.width - 6, size.height);
    path.lineTo(5, size.height);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _RightBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(6, 0);
    path.lineTo(size.width - 2, 0);
    path.quadraticBezierTo(size.width - 0.5, 1, size.width - 0.5, 2);
    path.lineTo(size.width - 4, size.height - 2);
    path.quadraticBezierTo(
        size.width - 4.5, size.height - 0.5, size.width - 6, size.height);
    path.lineTo(2, size.height);
    path.quadraticBezierTo(0.5, size.height - 0.5, 0, size.height - 2);
    path.lineTo(4, 2);
    path.lineTo(6, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _LeftBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 2);
    path.quadraticBezierTo(0.5, 0.5, 2, 0);
    path.lineTo(size.width - 4, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(5, size.height);
    path.quadraticBezierTo(4.5, size.height - 0.5, 4, size.height - 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
