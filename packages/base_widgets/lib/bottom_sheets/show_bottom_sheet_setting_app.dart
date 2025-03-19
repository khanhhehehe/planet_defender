import 'package:base_themes/base_color.dart';
import 'package:base_widgets/bottom_sheets/button_show_bottom_sheet_setting_app.dart';
import 'package:base_widgets/containers/content_container.dart';
import 'package:base_widgets/dialogs/show_dialog_sing_out.dart';
import 'package:base_widgets/gen/assets.gen.dart';
import 'package:base_widgets/models/button_content_model.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowBottomSettingApp extends StatefulWidget {
  ShowBottomSettingApp({
    super.key,
    this.level = '',
    this.titleAcademic = '',
    this.titleButtonStart = '',
    this.contentToolTips = const [],
    this.items = const [],
    this.titleLevel = '',
    this.contentDialog = '',
  });

  final List<String> contentToolTips;
  final List<ButtonContentModel> items;
  final String titleAcademic;
  final String level;
  final String titleButtonStart;
  final String contentDialog;
  String titleLevel = '';

  @override
  State<ShowBottomSettingApp> createState() => _ShowBottomSettingAppState();
}

class _ShowBottomSettingAppState extends State<ShowBottomSettingApp> {
  bool isEnabledAcademic = true;
  bool isHidden = true;
  int indexSelect = -1;
  int indexContent = 0;

  int indexParent = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Stack(
      children: [
        Column(
          // hiện nội dung của academic và ielts
          children: [
            // sizebox này để có phần thừa ở trên để hiện đc 2 nút academic và ielts
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(
                  bottom: SpacingUnit.x15_5, top: SpacingUnit.x15_5),
              height: SpacingUnit.x100,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.images.beveledBox.path),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      itemBuilder: (context, index) {
                        return ContentContainer(
                          callback: () {
                            if (isHidden == true) {
                              setState(() {
                                isHidden = false;
                              });
                            }

                            setState(() {
                              indexSelect = index;
                            });

                            setState(() {
                              widget.titleLevel =
                                  widget.items[indexParent].items[index];
                            });
                          },
                          isSelect: index == indexSelect,
                          textContent: widget.items[indexParent].items[index],
                        );
                      },
                      itemCount: isEnabledAcademic
                          ? widget.items[0].items.length
                          : widget.items[1].items.length,
                    ),
                  ),
                  isHidden
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: SpacingUnit.x6),
                          height: SpacingUnit.x10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(SpacingUnit.x1),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: colors.gradientNavy),
                              boxShadow: [
                                BoxShadow(
                                    color: colors.shadowButton,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2))
                              ]),
                          child: ElevatedButton(
                            onPressed: () {
                              showAlertDialog(
                                context: context,
                                content: widget.contentDialog,
                                textButtonLeft: 'Hủy (4)',
                                textButtonRight: 'Xác nhận ',
                                onCancel: () {},
                                onContinue: () {},
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                            child: Text(
                              widget.titleButtonStart,
                              style: theme.textTheme.bodyLarge
                                  ?.copyWith(color: colors.onPrimary),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          child: Stack(
            children: [
              // làm về 2 nút academic và ielts có thể nhấn
              SizedBox(
                  height: SpacingUnit.x10,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      ButtonShowBottomSheetSettingApp(
                        // xử lý 2 nút nhấn trong này
                        indexContent: indexContent,
                        indexParent: indexParent,
                        isEnabledAcademic: isEnabledAcademic,
                        pathImageDisable: Assets.images.buttonDisabledLeft.path,
                        pathImageEnabled: Assets.images.buttonEnabledLeft.path,
                        onTap: () {
                          setState(() {
                            isEnabledAcademic = !isEnabledAcademic;
                          });

                          if (indexContent == 1) {
                            setState(() {
                              indexContent = 0;
                            });
                          } else {
                            setState(() {
                              indexContent = 1;
                            });
                          }

                          if (indexParent == 0) {
                            setState(() {
                              indexParent = 1;
                            });
                          } else {
                            setState(() {
                              indexParent = 0;
                            });
                          }
                        },
                      ),
                      ButtonShowBottomSheetSettingApp(
                        // xử lý 2 nút nhấn trong này
                        indexContent: indexContent,
                        indexParent: indexParent,
                        isEnabledAcademic: !isEnabledAcademic,
                        pathImageDisable:
                            Assets.images.buttonDisabledRight.path,
                        pathImageEnabled: Assets.images.buttonEnabledRight.path,
                        onTap: () {
                          setState(() {
                            isEnabledAcademic = !isEnabledAcademic;
                          });

                          if (indexContent == 1) {
                            setState(() {
                              indexContent = 0;
                            });
                          } else {
                            setState(() {
                              indexContent = 1;
                            });
                          }

                          if (indexParent == 0) {
                            setState(() {
                              indexParent = 1;
                            });
                          } else {
                            setState(() {
                              indexParent = 0;
                            });
                          }
                        },
                      ),
                    ],
                  )),
              Positioned(
                // làm nhấn icon info hiện tooltips
                top: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isEnabledAcademic = !isEnabledAcademic;
                              });
                            },
                            child: Text(widget.titleAcademic,
                                style: theme.textTheme.titleLarge?.copyWith(
                                    fontSize: SpacingUnit.x4,
                                    fontWeight: FontWeight.w700,
                                    color: isEnabledAcademic
                                        ? theme.colorScheme.onSecondary
                                        : colors.surfaceContainer)),
                          ),
                          const SizedBox(
                            width: SpacingUnit.x2,
                          ),
                          isEnabledAcademic
                              ? showToolTip(
                                  Icon(
                                    Icons.info,
                                    color: isEnabledAcademic
                                        ? theme.colorScheme.onPrimary
                                        : colors.surfaceContainer,
                                    size: SpacingUnit.x4_5,
                                  ),
                                  widget.contentToolTips,
                                  indexContent,
                                  theme.colorScheme.onSecondary,
                                  theme.colorScheme.secondaryContainer)
                              : Icon(
                                  Icons.info,
                                  color: isEnabledAcademic
                                      ? theme.colorScheme.onPrimary
                                      : colors.surfaceContainer,
                                  size: SpacingUnit.x4_5,
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isEnabledAcademic = !isEnabledAcademic;
                              });
                            },
                            child: Text(
                              widget.level,
                              style: theme.textTheme.titleLarge?.copyWith(
                                  fontSize: SpacingUnit.x4,
                                  fontWeight: FontWeight.w700,
                                  color: isEnabledAcademic
                                      ? colors.surfaceContainer
                                      : theme.colorScheme.onPrimary),
                            ),
                          ),
                          const SizedBox(
                            width: SpacingUnit.x2,
                          ),
                          isEnabledAcademic
                              ? Icon(
                                  Icons.info,
                                  color: isEnabledAcademic
                                      ? colors.surfaceContainer
                                      : colors.onPrimary,
                                  size: SpacingUnit.x4_5,
                                )
                              : showToolTip(
                                  Icon(
                                    Icons.info,
                                    color: isEnabledAcademic
                                        ? colors.surfaceContainer
                                        : colors.onPrimary,
                                    size: SpacingUnit.x4_5,
                                  ),
                                  widget.contentToolTips,
                                  indexContent,
                                  theme.colorScheme.onSecondary,
                                  theme.colorScheme.secondaryContainer),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget showToolTip(Widget child, List<String> listContents, int indexContent,
    Color textColor, Color bgColor) {
  return Tooltip(
    message: listContents[indexContent],
    textStyle:
        TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: textColor),
    decoration: BoxDecoration(
        color: bgColor, borderRadius: BorderRadius.circular(SpacingUnit.x1)),
    child: child,
  );
}
