import 'package:base_themes/base_color.dart';
import 'package:base_widgets/buttons/custom_select_button.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ContentChangPasswordIsSuccess extends StatelessWidget {
  const ContentChangPasswordIsSuccess(
      {super.key,
      this.changePasswordSuccess = '',
      this.descriptionChangePassword = '',
      this.pathImageSuccess = '',
      this.textButtonReturn = ''});
  final String pathImageSuccess;
  final String changePasswordSuccess;
  final String descriptionChangePassword;
  final String textButtonReturn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x6),
        child: Column(
          children: [
            SizedBox(
              height: SpacingUnit.x6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage(pathImageSuccess)),
                  const SizedBox(
                    width: SpacingUnit.x2,
                  ),
                  Text(
                    changePasswordSuccess,
                    style: theme.textTheme.labelMedium?.copyWith(
                        color: const Color(0xFF2EE5A8),
                        fontSize: SpacingUnit.x3_5,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: SpacingUnit.x3_5,
            ),
            Text(
              textAlign: TextAlign.center,
              descriptionChangePassword,
              style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: SpacingUnit.x3_5,
                  fontWeight: FontWeight.w600,
                  color: colors.surfaceDim),
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
                            textButton: 'Trở lại',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomSelectButton(
                            callback: () {},
                            textButton: 'Trở lại',
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
