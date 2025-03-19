import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:base_widgets/containers/error_message.dart';
import 'package:base_widgets/inputs/input_app_setting.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ContentChangPassword extends StatelessWidget {
  const ContentChangPassword({
    super.key,
    this.documentConditionsOne = '',
    this.documentConditionsTwo = '',
    this.isCurrentPasswordIsWrong = false,
    this.isHiddenTitle = true,
    this.labelConfirmPassword = '',
    this.labelCurrentPassword = '',
    this.labelPassword = '',
    this.pathImageWarning = '',
    this.textButtonConfirm = '',
    this.textButtonReturn = '',
    this.textPasswordIsWrong = '',
    this.wrongTextFormat = '',
  });
  final bool isHiddenTitle;
  final bool isCurrentPasswordIsWrong;
  final String pathImageWarning;
  final String textPasswordIsWrong;
  final String wrongTextFormat;
  final String labelCurrentPassword;
  final String labelPassword;
  final String documentConditionsOne;
  final String documentConditionsTwo;
  final String labelConfirmPassword;
  final String textButtonConfirm;
  final String textButtonReturn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            left: SpacingUnit.x2_5, right: SpacingUnit.x2_5),
        child: Column(
          children: [
            const SizedBox(
              height: SpacingUnit.x16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x2),
              child: Column(
                children: [
                  // kiểm tra xem có lỗi ko hiện thông báo lỗi
                  isHiddenTitle
                      ? const SizedBox(
                          height: 16,
                        )
                      : ErrorMessage(
                          isCurrentPasswordIsWrong: isCurrentPasswordIsWrong,
                          pathImageWarning: pathImageWarning,
                          textPasswordIsWrong: textPasswordIsWrong,
                          theme: theme,
                          wrongTextFormat: wrongTextFormat),
                  InputAppSetting(
                    labelText: labelCurrentPassword,
                  ),
                  const SizedBox(
                    height: SpacingUnit.x3_5,
                  ),
                  InputAppSetting(
                    labelText: labelPassword,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SpacingUnit.x4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SpacingUnit.x1,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Text(
                          documentConditionsOne,
                          style: TextStyle(
                              color: colors.surfaceContainerLow,
                              fontSize: SpacingUnit.x3,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          documentConditionsTwo,
                          style: TextStyle(
                              color: colors.surfaceContainerLow,
                              fontSize: SpacingUnit.x3,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: SpacingUnit.x5,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: SpacingUnit.x3,
                  ),
                  InputAppSetting(
                    isError: true,
                    labelText: labelConfirmPassword,
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width - SpacingUnit.x10_5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(SpacingUnit.x2_5),
                      bottomRight: Radius.circular(SpacingUnit.x2_5),
                    ),
                    image: DecorationImage(
                        image: AssetImage('images/hive.png'), fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                    bottom: SpacingUnit.x10,
                    child: SizedBox(
                      width:
                          MediaQuery.of(context).size.width - SpacingUnit.x11,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSelectButton(
                            callback: () {},
                            textButton: 'Xác nhận',
                          ),
                          const SizedBox(
                            width: SpacingUnit.x2_5,
                          ),
                          CustomSelectButton(
                            callback: () {},
                            textButton: 'Hủy',
                            colorGradient: const [Colors.white, Colors.white],
                            colorText: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
