import 'package:flutter/material.dart';

enum Logo { google, facebook, apple, account }

class ButtonLogoApp extends StatelessWidget {
  final double width;
  final double height;
  final Image? image;

  const ButtonLogoApp(
      {super.key, this.width = 84, this.height = 48, this.image});

  @override
  Widget build(BuildContext context) {
    if (image == null) return const SizedBox();
    return Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: image);
  }
}
