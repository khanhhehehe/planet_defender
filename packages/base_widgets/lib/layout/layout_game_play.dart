import 'package:flutter/material.dart';

class LayoutGamePlay extends StatefulWidget {
  final String pathImageBackground;
  final String pathImageBackgroundFullMana;
  final bool isFullMana;
  final List<Widget> widgets;

  const LayoutGamePlay({
    super.key,
    this.pathImageBackground = '',
    required this.widgets,
    this.pathImageBackgroundFullMana = "",
    required this.isFullMana,
  });

  @override
  State<LayoutGamePlay> createState() => _LayoutGamePlayState();
}

class _LayoutGamePlayState extends State<LayoutGamePlay> {
  String value = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: [
      Image.asset(
        widget.pathImageBackground,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      if (widget.isFullMana)
        Image.asset(
          widget.pathImageBackgroundFullMana,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ...widget.widgets
    ]));
  }
}
