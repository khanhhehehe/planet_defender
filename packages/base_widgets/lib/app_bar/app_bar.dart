import 'package:base_themes/base_color.dart';
import 'package:base_widgets/border/border_select_item_intro.dart';
import 'package:base_widgets/gen/assets.gen.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AppBarGamePlay extends StatelessWidget {
  final bool introScoreBoard;
  final bool introCurrentRound;
  final String round;
  final String score;
  final String coin;
  final VoidCallback onPause;
  const AppBarGamePlay(
      {super.key,
      this.coin = "_ _ _",
      this.introScoreBoard = false,
      this.introCurrentRound = false,
      this.round = "_ _ _",
      this.score = "_ _ _",
      required this.onPause});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          Assets.images.baseAppBar.path,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).width / 3.7,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).width / 11,
          height: MediaQuery.sizeOf(context).width / 6.4,
          child: CustomPaint(
            painter: introScoreBoard ? BorderSelectItem(width: 12) : null,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width / 2.4,
                    height: MediaQuery.sizeOf(context).width / 11,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.images.baseBgPoint.path),
                            fit: BoxFit.fill)),
                    child: Text(score,
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.sizeOf(context).width / 14,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width / 3.8,
                    height: MediaQuery.sizeOf(context).width / 18,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.images.baseBgRound.path),
                            fit: BoxFit.fill)),
                    child: Text(round,
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: MediaQuery.sizeOf(context).width / 1.35,
          top: MediaQuery.sizeOf(context).width / 9.5,
          child: GestureDetector(
            onTap: () {
              onPause.call();
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width / 4.5,
              height: MediaQuery.sizeOf(context).width / 8,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.images.baseAppBarLeftBtn.path),
                      fit: BoxFit.contain)),
              child: const Icon(
                Icons.pause,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.sizeOf(context).width / 1.35,
          top: MediaQuery.sizeOf(context).width / 9.5,
          child: Container(
            width: MediaQuery.sizeOf(context).width / 4.5,
            height: MediaQuery.sizeOf(context).width / 8,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.baseAppBarRightBtn.path),
                    fit: BoxFit.contain)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(coin, style: const TextStyle(color: Colors.white)),
                const SizedBox(
                  width: SpacingUnit.x1,
                ),
                Image.asset(Assets.images.coin.path),
                const SizedBox(
                  width: SpacingUnit.x2,
                )
              ],
            ),
          ),
        ),
        if (introCurrentRound) ...[
          Container(
            color: colors.background.withOpacity(0.7),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width / 3.7,
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).width / 10.7,
            child: CustomPaint(
              painter: BorderSelectItem(width: 6),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width / 3.8,
                height: MediaQuery.sizeOf(context).width / 18,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.images.baseBgRound.path),
                        fit: BoxFit.fill)),
                child: Text(round, style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
        if (introScoreBoard) ...[
          Container(
            color: colors.background.withOpacity(0.7),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width / 3.7,
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).width / 11,
            height: MediaQuery.sizeOf(context).width / 6.4,
            child: CustomPaint(
              painter: BorderSelectItem(width: 12),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width / 2.4,
                      height: MediaQuery.sizeOf(context).width / 11,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.images.baseBgPoint.path),
                              fit: BoxFit.fill)),
                      child: Text(score,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.sizeOf(context).width / 14,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width / 3.8,
                      height: MediaQuery.sizeOf(context).width / 18,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.images.baseBgRound.path),
                              fit: BoxFit.fill)),
                      child: Text(round,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ],
    );
  }
}
