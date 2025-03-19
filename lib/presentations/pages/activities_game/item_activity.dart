import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:planet_defender/gen/assets.gen.dart';

class ItemActivity extends StatelessWidget {
  final String title;
  final String date;
  final String image;
  final String description;
  final bool isShowDescription;
  final VoidCallback? onPress;
  final String type;
  const ItemActivity(
      {super.key,
      this.title = 'EVENTS',
      this.date = '',
      this.image = '',
      this.description = '',
      this.isShowDescription = false,
      this.onPress,
      this.type = ''});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final theme = Theme.of(context);
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(SpacingUnit.x2),
        decoration: BoxDecoration(
            color: colors.surfaceDim,
            borderRadius: BorderRadius.circular(SpacingUnit.x5)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: SpacingUnit.x2, vertical: SpacingUnit.x1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(type,
                    style: TextStyle(
                        color: colors.textLight,
                        fontWeight: FontWeight.w700,
                        fontSize: 12)),
                Text(
                  date,
                  style: TextStyle(
                      color: colors.textSecondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 11),
                )
              ],
            ),
          ),
          const SizedBox(height: SpacingUnit.x2),
          ClipRRect(
              borderRadius: BorderRadius.circular(SpacingUnit.x3),
              child: Image.asset(image)),
          if (isShowDescription) ...[
            const SizedBox(height: SpacingUnit.x2),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: SpacingUnit.x3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.images.divider.path),
                      fit: BoxFit.fitWidth)),
            ),
            const SizedBox(height: SpacingUnit.x2),
            Container(
              margin: const EdgeInsets.only(bottom: SpacingUnit.x7),
              padding: const EdgeInsets.all(SpacingUnit.x2_5),
              decoration: BoxDecoration(
                  color: colors.onSurface,
                  border: Border.all(
                      width: SpacingUnit.x0_75, color: const Color(0xFFE5E9F5)),
                  borderRadius: BorderRadius.circular(SpacingUnit.x3)),
              child: Text('$title \n\n $description',
                  style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.textSecondary)),
            )
          ]
        ]),
      ),
      Positioned(
        left: MediaQuery.sizeOf(context).width * 0.291,
        bottom: 0,
        child: InkWell(
          onTap: () => onPress?.call(),
          child: Container(
            height: SpacingUnit.x4_5,
            width: SpacingUnit.x35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.buttonBottom.path),
                    fit: BoxFit.fill)),
            child: Icon(_iconShowDescription(isShowDescription),
                color: colors.onSurface),
          ),
        ),
      )
    ]);
  }
}

IconData _iconShowDescription(bool value) {
  return value ? Icons.arrow_drop_up : Icons.arrow_drop_down;
}
