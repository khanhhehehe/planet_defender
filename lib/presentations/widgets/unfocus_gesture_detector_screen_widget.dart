import 'package:flutter/material.dart';

class UnfocusGestureDetectorScreen extends StatelessWidget {
  final Widget? child;
  const UnfocusGestureDetectorScreen({super.key, required this.child});

  void _unfocusGestureDetector() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: GestureDetector(onTap: _unfocusGestureDetector, child: child));
  }
}
