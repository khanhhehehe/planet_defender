import 'package:planet_defender/presentations/themes/themes.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String title;
  final String? icon;
  final bool selected;
  final bool enable;
  final double height;
  final VoidCallback onSubmit;
  final Color color;

  const AppButton(
      {super.key,
      required this.title,
      required this.onSubmit,
      this.icon,
      this.selected = false,
      this.enable = true,
      this.height = 48,
      this.color = Colors.white});

  @override
  State<StatefulWidget> createState() => _AppButton();
}

class _AppButton extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = AppTheme.getColors(context);
    return InkWell(
      onTap: () {
        if (widget.enable == true) widget.onSubmit();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF257EE5),
                Color(0xFF005ECC),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(width: 1.5, color: widget.color)),
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(color: colors.text),
          ),
        ),
      ),
    );
  }
}
