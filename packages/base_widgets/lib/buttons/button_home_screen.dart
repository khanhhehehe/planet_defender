import 'package:flutter/material.dart';

class ButtonHomeScreen extends StatelessWidget {
  const ButtonHomeScreen(
      {super.key,
      this.width = 100,
      this.height = 40,
      this.pathName = '',
      required this.callback});

  final VoidCallback callback;
  final double width;
  final double height;
  final String pathName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback.call(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pathName),
          ),
        ),
      ),
    );
  }
}
