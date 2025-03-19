import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final bool isTop;
  final bool isRight;
  const MessageDialog(
      {super.key,
      required this.title,
      this.isTop = false,
      this.isRight = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        SizedBox(
          height: SpacingUnit.x12,
          child: Stack(
            alignment: isTop ? Alignment.bottomCenter : Alignment.topCenter,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x5),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(SpacingUnit.x2)),
                  color: Colors.white,
                ),
                height: SpacingUnit.x8_5,
                child: Text(
                  title,
                  style:
                      theme.textTheme.bodySmall!.copyWith(color: Colors.black),
                ),
              ),
              Positioned(
                top: isTop
                    ? SpacingUnit.x1_5
                    : isRight
                        ? null
                        : SpacingUnit.x7_5,
                child: ClipPath(
                  clipper: isTop ? MessageBorderTop() : MessageBorderBottom(),
                  child: Container(
                    height: SpacingUnit.x2_5,
                    width: SpacingUnit.x4,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        isRight
            ? Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: SpacingUnit.x2_5,
                child: ClipPath(
                  clipper: MessageBorderRight(),
                  child: Container(
                    height: SpacingUnit.x2_5,
                    width: SpacingUnit.x4,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

class MessageBorderBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final Path path = Path()
      ..lineTo(width, 0)
      ..lineTo(width / 2, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}

class MessageBorderTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    final Path path = Path()
      ..moveTo(0, height)
      ..lineTo(width / 2, 0)
      ..lineTo(width, height)
      ..lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}

class MessageBorderRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    final Path path = Path()
      ..moveTo(0, height)
      ..lineTo(0, 0)
      ..lineTo(width / 1.5, height / 2)
      ..lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
