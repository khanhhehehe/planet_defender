import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/text_button.dart';
import 'package:base_widgets/molecules/signin_signup/bottom_sign_in.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class LayoutGameFselSignIn extends StatefulWidget {
  final Widget child;
  final String titleScreen;
  final String pathImageHeaderName;
  final String pathImageBackgroundName;
  final String imageIcon;
  final String titleBottomLayout;
  final int bottomLoginLayout;
  final List<String> buttonIcons;
  final VoidCallback onPressed;
  const LayoutGameFselSignIn({
    super.key,
    required this.child,
    this.titleScreen = 'title',
    this.pathImageHeaderName = 'path image',
    this.pathImageBackgroundName = 'path image',
    this.imageIcon = 'path image',
    this.titleBottomLayout = 'title bottom layout',
    required this.bottomLoginLayout,
    this.buttonIcons = const [],
    required this.onPressed,
  });

  @override
  State<LayoutGameFselSignIn> createState() => _LayoutGameFselSignInState();
}

class _LayoutGameFselSignInState extends State<LayoutGameFselSignIn> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            widget.pathImageBackgroundName,
            fit: BoxFit.fill,
          ),
        ),
        if (widget.bottomLoginLayout == 3)
          Container(color: Colors.black.withOpacity(0.6)),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x9),
              child: Column(
                children: [
                  SizedBox(
                    height: widget.bottomLoginLayout == 3
                        ? SpacingUnit.x13
                        : SpacingUnit.x49,
                  ),
                  Image(image: AssetImage(widget.imageIcon)),
                  const SizedBox(
                    height: SpacingUnit.x16,
                  ),
                  widget.child,
                  if (widget.bottomLoginLayout == 0)
                    Column(
                      children: [
                        const SizedBox(
                          height: SpacingUnit.x4,
                        ),
                        InkWell(
                          onTap: widget.onPressed,
                          child: BottomOtherSignIn(
                            title: widget.titleBottomLayout,
                            titleStyle: theme.textTheme.labelSmall
                                ?.copyWith(color: colors.surfaceDim),
                            buttonImages: widget.buttonIcons,
                          ),
                        )
                      ],
                    )
                  else if (widget.bottomLoginLayout == 1)
                    Column(
                      children: [
                        const SizedBox(
                          height: SpacingUnit.x55,
                        ),
                        AppTextButton(
                          onPressed: widget.onPressed,
                          textHint: widget.titleBottomLayout,
                          textColor: colors.surfaceContainerLow,
                          isShowLeftIcon: true,
                        ),
                        const SizedBox(
                          height: SpacingUnit.x16,
                        )
                      ],
                    )
                  else
                    const SizedBox(),
                  const SizedBox(height: SpacingUnit.x14)
                ],
              ),
            ),
          ),
        ),
        if (widget.bottomLoginLayout != 3)
          SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(children: [
                Container(
                  height: SpacingUnit.x37_5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.pathImageHeaderName),
                          fit: BoxFit.fill)),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.titleScreen,
                      style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.onSecondary,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ])),
      ],
    );
  }
}
