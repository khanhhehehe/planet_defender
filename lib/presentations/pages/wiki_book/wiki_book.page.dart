// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/button_rectangle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/meteorite/wiki_meteorite_bloc.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/meteorite/wiki_meteorite_state.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/space_ship/wiki_spaceship_bloc.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/space_ship/wiki_spaceship_state.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/z_buff/wiki_z_buff_bloc.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/z_buff/wiki_z_buff_state.dart';
import 'package:planet_defender/presentations/pages/wiki_book/item_detail.dart';
import 'package:planet_defender/presentations/pages/wiki_book/meteorite_wikibook.dart';
import 'package:planet_defender/presentations/pages/wiki_book/spaceship_wikibook.dart';
import 'package:planet_defender/presentations/pages/wiki_book/zbuff_wikibook.dart';

// final wikiBookPage = GoRoute(
//     path: Pages.wikiBook,
//     builder: (context, GoRouterState state) => const WikiBookPage());

enum WikiBookType {
  zBuff("Z-Buff"),
  spaceShip("Spaceship"),
  meteorite("Meteorite");

  final String name;
  const WikiBookType(this.name);
}

class WikiBookPage extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  const WikiBookPage({super.key, required this.onItemTapped});

  @override
  State<WikiBookPage> createState() => _WikiBookPageState();
}

class _WikiBookPageState extends State<WikiBookPage> {
  WikiBookType initScreen = WikiBookType.zBuff;
  bool showDetail = false;
  var itemSelected;
  int currentIndex = 0;
  void _changeScreen(WikiBookType value) {
    if (initScreen != value) {
      setState(() {
        initScreen = value;
      });
    }
  }

  String _buttonBackground(WikiBookType value) {
    return value == WikiBookType.zBuff
        ? Assets.images.buttonBaseFive.path
        : value == WikiBookType.spaceShip
            ? Assets.images.buttonBaseFour.path
            : Assets.images.buttonBaseThird.path;
  }

  Color _buttonColor(BaseThemeColor colors, WikiBookType value) {
    return value == initScreen ? colors.onPrimary : colors.surfaceBright;
  }

  void _selectItem(value) {
    setState(() {
      showDetail = !showDetail;
      itemSelected = value;
    });
  }

  void _selectIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _nextItem(Map items) {
    setState(() {
      if (currentIndex < items.values.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      itemSelected = items.values.elementAt(currentIndex);
    });
  }

  void _backItem(Map items) {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = items.values.length - 1;
      }
      itemSelected = items.values.elementAt(currentIndex);
    });
  }

  @override
  void initState() {
    dI<WikiZBuffBloc>().add(const GetZBuff());
    dI<WikiSpaceshipsBloc>().add(const GetWikiSpaceships());
    dI<WikiMeteoriteBloc>().add(const GetWikiMeteorite());
    super.initState();
  }

  String _detailImage(item) {
    if (initScreen == WikiBookType.zBuff) {
      return item.filePath;
    }
    return item.image;
  }

  String _subString(item) {
    if (initScreen == WikiBookType.zBuff) {
      return item.usage;
    } else if (initScreen == WikiBookType.meteorite) {
      return item.hint;
    }
    return '';
  }

  String _itemName(item) {
    if (initScreen == WikiBookType.meteorite) {
      return item.type.name;
    }
    return item.name;
  }

  bool _itemIsLock(item) {
    if (initScreen != WikiBookType.meteorite) {
      return !itemSelected.isOwned;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Scaffold(
      body: Container(
        color: colors.surfaceContainerLowest,
        child: Column(children: [
          const SizedBox(height: SpacingUnit.x10_5),
          Stack(children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
              padding: const EdgeInsets.all(SpacingUnit.x2),
              height: MediaQuery.sizeOf(context).height * 0.84,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.images.container2.path),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(SpacingUnit.x4),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        color: colors.background.withOpacity(0.3))
                  ]),
              child: showDetail
                  ? BlocBuilder<WikiMeteoriteBloc, WikiMeteoriteState>(
                      builder: (context, stateMeteorite) {
                        return BlocBuilder<WikiSpaceshipsBloc,
                            WikiSpaceshipState>(
                          builder: (context, stateSpaceship) {
                            return BlocBuilder<WikiZBuffBloc, WikiZBuffState>(
                              builder: (context, stateZBuff) {
                                return ItemDetail(
                                  onClose: () {
                                    _selectItem('');
                                    currentIndex = 0;
                                  },
                                  name: _itemName(itemSelected),
                                  image: _detailImage(itemSelected),
                                  content: itemSelected.description,
                                  hint: _subString(itemSelected),
                                  isLock: _itemIsLock(itemSelected),
                                  title: _itemIsLock(itemSelected)
                                      ? '[Điều kiện mở khóa]'
                                      : initScreen == WikiBookType.zBuff
                                          ? '[Tác dụng]'
                                          : initScreen == WikiBookType.spaceShip
                                              ? '[Tiểu sử]'
                                              : '[Mô tả]',
                                  onNextItem: () =>
                                      _nextItem(initScreen == WikiBookType.zBuff
                                          ? stateZBuff.zbuffs
                                          : initScreen == WikiBookType.spaceShip
                                              ? stateSpaceship.spaceShips
                                              : stateMeteorite.meteorites),
                                  onBackItem: () =>
                                      _backItem(initScreen == WikiBookType.zBuff
                                          ? stateZBuff.zbuffs
                                          : initScreen == WikiBookType.spaceShip
                                              ? stateSpaceship.spaceShips
                                              : stateMeteorite.meteorites),
                                  wikiBookType: initScreen,
                                  onItemTapped: (value) =>
                                      widget.onItemTapped(value),
                                );
                              },
                            );
                          },
                        );
                      },
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: SpacingUnit.x6),
                        initScreen == WikiBookType.zBuff
                            ? ZBuffWikibook(
                                selectItem: _selectItem,
                                selectIndex: _selectIndex)
                            : initScreen == WikiBookType.spaceShip
                                ? SpaceshipWikibook(
                                    selectItem: _selectItem,
                                    selectIndex: _selectIndex,
                                  )
                                : MeteoriteWikibook(selectItem: _selectItem),
                        Container(
                          padding: const EdgeInsets.only(top: SpacingUnit.x1_5),
                          child: Row(
                            children: WikiBookType.values.map((e) {
                              return Expanded(
                                  child: ButtonRectangle(
                                isEnabled: e == initScreen,
                                imageBackground: _buttonBackground(e),
                                title: e.name,
                                fontStyle: FontStyle.italic,
                                onPress: () {
                                  _changeScreen(e);
                                },
                                titleColor: _buttonColor(colors, e),
                              ));
                            }).toList(),
                          ),
                        )
                      ],
                    ),
            ),
            const BoxShape(),
            const BoxShape(
              rotate: 2,
              isTop: true,
            )
          ])
        ]),
      ),
    );
  }
}

class BoxShape extends StatelessWidget {
  final int rotate;
  final bool isTop;
  const BoxShape({super.key, this.rotate = 0, this.isTop = false});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: isTop ? 0 : null,
      bottom: !isTop ? 0 : null,
      left: MediaQuery.sizeOf(context).width * 0.33,
      child: RotatedBox(
        quarterTurns: rotate,
        child: Container(
          width: SpacingUnit.x35,
          height: SpacingUnit.x4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.images.bottomShape2.path),
                  fit: BoxFit.fitWidth)),
        ),
      ),
    );
  }
}
