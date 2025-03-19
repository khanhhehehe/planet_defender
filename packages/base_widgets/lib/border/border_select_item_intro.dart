import 'package:flutter/material.dart';

class BorderSelectItem extends CustomPainter {
  final double width;
  BorderSelectItem({this.width = 20});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = const Color(0xFF5DF5FF);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, width);
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.moveTo(0, size.height);
    path.lineTo(0, size.height - width);
    path.moveTo(0, size.height);
    path.lineTo(width, size.height);
    path.moveTo(size.width, size.height);
    path.lineTo(size.width - width, size.height);
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height - width);
    path.moveTo(size.width, 0);
    path.lineTo(size.width, width);
    path.moveTo(size.width, 0);
    path.lineTo(size.width - width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
