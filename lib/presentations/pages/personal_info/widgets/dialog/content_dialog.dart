import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/dialog/checkbox.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/dialog/choose_avatar.dart';
import 'package:planet_defender/presentations/pages/personal_info/widgets/dialog/choose_tag.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:base_widgets/images/personal_info/avatar.dart';
import 'package:base_widgets/molecules/personal_info/bottom_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool dialogChooseAvatar = true;
bool filterUnlock = false;

class ContentDialog extends StatefulWidget {
  const ContentDialog({super.key});

  @override
  State<ContentDialog> createState() => _ContentDialogState();
}

class _ContentDialogState extends State<ContentDialog> {
  void changeSelect() {
    setState(() {
      dialogChooseAvatar = !dialogChooseAvatar;
    });
  }

  void changeUnlock() {
    setState(() {
      filterUnlock = !filterUnlock;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Column(
      children: [
        const SizedBox(height: SpacingUnit.x2_5),
        UserAvatar(image: Assets.images.cosmo.path),
        Text(
          "Cosmo",
          style: theme.textTheme.headlineMedium!
              .copyWith(fontWeight: FontWeight.w700, color: colors.text),
        ),
        const SizedBox(height: SpacingUnit.x1),
        Text(
          "Tổng tư lệnh",
          style: theme.textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w600, color: colors.textTertiary),
        ),
        const SizedBox(height: SpacingUnit.x3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x1_5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                dialogChooseAvatar ? 'Danh sách Avatar' : 'Biệt danh',
                style: theme.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w700, color: colors.textTertiary),
              ),
              CheckboxPersonalInfo(
                onChange: () => changeUnlock(),
                isChecked: filterUnlock,
                checkFillColor: Colors.transparent,
                activeColor: theme.colorScheme.outline,
                notCheckFillColor: Colors.transparent,
                borderColor: theme.colorScheme.outline,
                titleCheckbox: 'Đã mở khóa',
                titleStyle: theme.textTheme.labelSmall!
                    .copyWith(color: colors.textSecondary),
              )
            ],
          ),
        ),
        const SizedBox(height: SpacingUnit.x2_5),
        SizedBox(
            height: SpacingUnit.x61_5,
            child: dialogChooseAvatar
                ? BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
                    builder: (context, state) {
                      return ChooseAvatar(
                        avatars: state.avatars.values.toList(),
                        isUnlocked: filterUnlock,
                        onChoose: () {},
                        messageTooltip: 'Đạt level 50',
                      );
                    },
                  )
                : BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
                    builder: (context, state) {
                      return ChooseTag(
                        tags: state.tags.values.toList(),
                        isUnlocked: filterUnlock,
                        onChoose: () {},
                        messageTooltip: 'Đạt level 50',
                      );
                    },
                  )),
        const SizedBox(height: SpacingUnit.x2),
        Padding(
            padding: const EdgeInsets.only(
                left: SpacingUnit.x2_5,
                right: SpacingUnit.x2_5,
                top: SpacingUnit.x2_5),
            child: BottomDialogButton(
              onClose: () => Navigator.pop(context),
              onTag: () => changeSelect(),
              onSave: () {},
              actionImage: dialogChooseAvatar
                  ? Assets.images.menuDuo.path
                  : Assets.images.avatarIcon.path,
              textButton: 'Áp dụng',
            ))
      ],
    );
  }
}
