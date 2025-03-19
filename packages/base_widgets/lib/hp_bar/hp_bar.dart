import 'package:base_widgets/gen/assets.gen.dart';
import 'package:flutter/material.dart';

enum StatusType { hp, mana }

class HpBar extends StatefulWidget {
  final double height;
  final double width;
  final int mana;
  final int hp;
  final VoidCallback useSkill;
  const HpBar(
      {super.key,
      required this.height,
      required this.width,
      required this.mana,
      required this.hp,
      required this.useSkill});

  @override
  State<HpBar> createState() => _HpBarState();
}

class _HpBarState extends State<HpBar> {
  double getCurrentHp() {
    double currentHp = 0.70;
    for (var i = 0; i <= widget.hp; i++) {
      currentHp = currentHp - 0.0070;
    }
    return currentHp;
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.width;
    final height = widget.height;

    final Map<int, double> mapManaStatus = {
      100: 0,
      75: 0.175,
      50: 0.35,
      25: 0.525,
      0: 0.70
    };

    return Container(
      alignment: Alignment.center,
      width: widget.width / 3,
      height: widget.height / 1.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...listBorder(width: width, height: height),
          Positioned(
            right: width / 6,
            bottom: height / 7.5,
            child: CustomPaint(
              painter: BorderBar(isMana: false),
              child: ClipPath(
                clipper: HpClipPath(),
                child: Container(
                  height: height / 2.10,
                  width: width / 14,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: const Alignment(0, -1),
                    end: const Alignment(25, 1),
                    stops: listGradientStop(getCurrentHp(), mapManaStatus,
                        type: StatusType.hp),
                    colors: getColors(),
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            right: width / 8.5,
            bottom: height / 7.5,
            child: CustomPaint(
              painter: BorderBar(isMana: true),
              child: ClipPath(
                clipper: ManaClipPath(),
                child: Container(
                  height: height / 3.17,
                  width: width / 22,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: const Alignment(0, -1),
                    end: const Alignment(-20, 1),
                    stops: [
                      mapManaStatus[widget.mana] ?? 0,
                      0,
                      1,
                    ],
                    colors: const [
                      Color(0xFF252E4C),
                      Colors.amber,
                      Colors.orange,
                    ],
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            right: width / 23,
            bottom: height / 29,
            child: GestureDetector(
              onTap: () => widget.useSkill.call(),
              child: Image.asset(
                widget.mana >= 100
                    ? Assets.images.showSpecialSkill.path
                    : Assets.images.specialSkill.path,
                width: width / 3.5,
                height: width / 3.5,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Color> getColors() {
    if (widget.hp <= 50 && widget.hp > 25) {
      return [
        const Color(0xFF252E4C),
        Colors.amber,
        Colors.orange,
      ];
    }
    if (widget.hp <= 25) {
      return [const Color(0xFF252E4C), Colors.red, Colors.red];
    }
    return [
      const Color(0xFF252E4C),
      const Color(0xFFAFDDFF),
      const Color(0xFF709DFF),
      const Color(0xFF5885FF),
    ];
  }

  List<double> listGradientStop(mapHpStatus, mapManaStatus,
      {required StatusType type}) {
    if (widget.hp <= 50 && widget.hp > 25) {
      return [
        getCurrentHp(),
        0,
        1,
      ];
    }
    if (widget.hp <= 25) {
      return [
        getCurrentHp(),
        0,
        1,
      ];
    }
    return [
      getCurrentHp(),
      0,
      0.5,
      1,
    ];
  }

  List<Widget> listBorder({required double width, required double height}) {
    return [
      Positioned(
        right: width / 7,
        bottom: height / 7.7,
        child: ClipPath(
          clipper: HpClipPath(),
          child: Container(
            height: height / 2.01,
            width: width / 10,
            color: const Color.fromARGB(255, 118, 186, 231),
          ),
        ),
      ),
      Positioned(
        right: width / 11,
        bottom: height / 8,
        child: ClipPath(
          clipper: ManaClipPath(),
          child: Container(
            height: height / 3,
            width: width / 18,
            color: const Color.fromARGB(255, 118, 186, 231),
          ),
        ),
      ),
      Positioned(
        right: width / 40,
        bottom: height / 22,
        child: ClipPath(
          child: Image.asset(
            Assets.images.specialSkill.path,
            width: width / 3.5,
            height: width / 3.5,
            color: const Color.fromARGB(255, 118, 186, 231),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ];
  }
}

class ManaClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 17);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(ManaClipPath oldClipper) => false;
}

class HpClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height / 17);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(HpClipPath oldClipper) => false;
}

class BorderBar extends CustomPainter {
  final bool isMana;
  BorderBar({super.repaint, required this.isMana});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.blue;
    final path = Path();
    path.moveTo(0, size.height / 10);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, isMana ? size.height / 17 : 0);
    path.lineTo(0, isMana ? 0 : size.height / 19);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
