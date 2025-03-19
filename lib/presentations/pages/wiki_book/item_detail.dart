import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/button_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/pages/wiki_book/wiki_book.page.dart';

class ItemDetail extends StatelessWidget {
  final VoidCallback onClose;
  final String name;
  final String image;
  final String title;
  final String content;
  final String hint;
  final bool isLock;
  final VoidCallback onNextItem;
  final VoidCallback onBackItem;
  final WikiBookType wikiBookType;
  final ValueChanged<int> onItemTapped;
  const ItemDetail({
    super.key,
    required this.onClose,
    this.name = '',
    this.image = '',
    this.title = '',
    this.content = '',
    this.hint = '',
    this.isLock = false,
    required this.onNextItem,
    required this.onBackItem,
    required this.wikiBookType,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Container(
      decoration: BoxDecoration(
          color: colors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(SpacingUnit.x3)),
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              const SizedBox(height: SpacingUnit.x10),
              Text(
                name,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: colors.onSurface),
              ),
              const SizedBox(height: SpacingUnit.x4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => onBackItem.call(),
                      icon: Icon(
                        Icons.chevron_left,
                        color: colors.surfaceContainerBrightest,
                        size: SpacingUnit.x6,
                      )),
                  Stack(children: [
                    Opacity(
                      opacity: isLock ? 0.5 : 1,
                      child: Image.asset(
                        image,
                        width: SpacingUnit.x60,
                        height: SpacingUnit.x60,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    isLock
                        ? Positioned.fill(
                            child: Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  Assets.svg.lock,
                                  width: SpacingUnit.x14,
                                  height: SpacingUnit.x16_5,
                                )),
                          )
                        : const SizedBox()
                  ]),
                  IconButton(
                      onPressed: () => onNextItem.call(),
                      icon: Icon(
                        Icons.chevron_right,
                        color: colors.surfaceContainerBrightest,
                        size: SpacingUnit.x6,
                      )),
                ],
              ),
              if (wikiBookType == WikiBookType.spaceShip && isLock)
                CustomSelectButton(
                  callback: () => onItemTapped(2),
                  textButton: 'Mua ngay',
                ),
            ],
          )),
          _spaceShipIsLock(
              content: content,
              context: context,
              hint: hint,
              isLock: isLock,
              onClose: onClose,
              title: title,
              wikiBookType: wikiBookType)
        ],
      ),
    );
  }
}

String _content({required String content, required bool isLock}) {
  return !isLock ? content : '• Thu thập khi phá hủy Z-Matter';
}

Color _contentColor({required BaseThemeColor colors, required bool isLock}) {
  return isLock ? colors.textTertiary : colors.textLight;
}

FontStyle _contentStyle({required bool isLock}) {
  return isLock ? FontStyle.italic : FontStyle.normal;
}

String _hint({required String hint, required bool isLock}) {
  return !isLock ? hint : '';
}

Widget _spaceShipIsLock(
    {required WikiBookType wikiBookType,
    required BuildContext context,
    required String title,
    required bool isLock,
    required String content,
    required String hint,
    required VoidCallback onClose}) {
  if (wikiBookType == WikiBookType.spaceShip && isLock) {
    return _boxContentSpaceshipLock(context: context, onClose: onClose);
  }
  return _boxContent(
      content: content,
      context: context,
      hint: hint,
      isLock: isLock,
      onClose: onClose,
      title: title);
}

Widget _boxContent(
    {required BuildContext context,
    required String title,
    required bool isLock,
    required String content,
    required String hint,
    required VoidCallback onClose}) {
  final colors = BaseThemeColor.of(context);
  return Expanded(
      child: Container(
    padding: const EdgeInsets.all(SpacingUnit.x4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SpacingUnit.x3),
        image: DecorationImage(
            image: AssetImage(Assets.images.contentContainer.path),
            fit: BoxFit.fill)),
    child: Stack(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(width: double.infinity),
        Text(
          title,
          style: TextStyle(
              fontSize: SpacingUnit.x3_5,
              fontWeight: FontWeight.w700,
              color: isLock ? colors.textTertiary : colors.textLight),
        ),
        const SizedBox(height: SpacingUnit.x2),
        Text(_content(content: content, isLock: isLock),
            style: TextStyle(
                fontSize: SpacingUnit.x3_5,
                fontWeight: FontWeight.w600,
                color: _contentColor(colors: colors, isLock: isLock),
                fontStyle: _contentStyle(isLock: isLock))),
        const SizedBox(height: SpacingUnit.x4),
        Text(_hint(hint: hint, isLock: isLock),
            style: TextStyle(
                fontSize: SpacingUnit.x3,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: colors.textSecondary))
      ]),
      Positioned(
          bottom: 0,
          right: 0,
          child: ButtonClose(
              child: Icon(Icons.close, color: colors.textSecondary),
              onPress: () {
                onClose.call();
              })),
    ]),
  ));
}

Widget _boxContentSpaceshipLock(
    {required BuildContext context, required VoidCallback onClose}) {
  final colors = BaseThemeColor.of(context);
  return Container(
    padding: const EdgeInsets.all(SpacingUnit.x4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SpacingUnit.x3),
        image: DecorationImage(
            image: AssetImage(Assets.images.contentContainer.path),
            fit: BoxFit.fill)),
    child: Stack(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('[Mở khóa để đọc tiểu sử]',
            style: TextStyle(
                fontWeight: FontWeight.w700, color: colors.textTertiary)),
        ButtonClose(
            child: Icon(Icons.close, color: colors.textSecondary),
            onPress: () {
              onClose.call();
            }),
      ]),
    ]),
  );
}
