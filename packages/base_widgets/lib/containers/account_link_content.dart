import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:base_widgets/buttons/custom_text_button.dart';
import 'package:base_widgets/containers/icon_error_and_title.dart';
import 'package:base_widgets/inputs/input_app_setting.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class AccountLinkContent extends StatelessWidget {
  const AccountLinkContent(
      {super.key,
      this.isAccountError = false,
      this.isError = false,
      this.pathImageErrorRed = ''});

  final bool isError;
  final bool isAccountError;
  final String pathImageErrorRed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
        child: Column(
          children: [
            SizedBox(
              height: isError ? SpacingUnit.x8 : SpacingUnit.x16,
            ),
            isError
                ? isAccountError
                    ? IconErrorAndTitle(
                        pathImageError: pathImageErrorRed,
                        textError: 'Tài khoản không tồn tại',
                      )
                    : IconErrorAndTitle(
                        pathImageError: pathImageErrorRed,
                        textError: 'Mật khẩu không chính xác',
                      )
                : const SizedBox(),
            InputAppSetting(
              labelText: 'Địa chỉ Email / Số điện thoại',
              isHidePassword: false,
            ),
            const SizedBox(
              height: SpacingUnit.x3,
            ),
            InputAppSetting(
              labelText: 'Mật khẩu',
            ),
            const SizedBox(
              height: SpacingUnit.x3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                      onPressed: () {}, textButton: 'Quên mật khẩu ?'),
                  CustomTextButton(
                    onPressed: () {},
                    textButton: 'Tạo tài khoản',
                    textColor: theme.colorScheme.primary,
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
                          MediaQuery.of(context).size.width - SpacingUnit.x20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSelectButton(
                            callback: () {},
                            textButton: 'Liên kết',
                          ),
                          const SizedBox(
                            width: 10,
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
