import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ButtonAndIcon extends StatelessWidget {
  const ButtonAndIcon({
    super.key,
    required this.callback,
    this.textButton = '',
    this.width = 144,
    this.height = 40,
    this.shadowColor = const Color(0xFF00FFF0),
    this.colorGradient = const [Color(0xFF2E54E5), Color(0xFF288CF5)],
    this.colorText = Colors.white,
    this.borderRadius = 4,
    this.icon = Icons.autorenew,
  });
  final VoidCallback callback;
  final String textButton;
  final double width;
  final double height;
  final Color shadowColor;
  final Color colorText;
  final List<Color> colorGradient;
  final double borderRadius;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: shadowColor, blurRadius: 0, offset: const Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
            colors: colorGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: ElevatedButton(
        onPressed: () {
          callback.call();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textButton,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: SpacingUnit.x4,
                fontWeight: FontWeight.w600,
                color: colorText,
              ),
            ),
            const SizedBox(
              width: SpacingUnit.x2,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: SpacingUnit.x4_5,
            )
          ],
        ),
      ),
    );
  }
}
