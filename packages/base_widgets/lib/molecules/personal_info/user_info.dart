import 'package:base_themes/base_color.dart';
import 'package:base_widgets/images/personal_info/avatar.dart';
import 'package:common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String image;
  final String userName;
  final String role;
  final String? backgroundAvatar;
  final VoidCallback onPress;
  const UserInfo(
      {super.key,
      required this.image,
      this.userName = '',
      this.role = '',
      this.backgroundAvatar,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = BaseThemeColor.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x4),
      child: InkWell(
        onTap: () => onPress.call(),
        child: Column(
          children: [
            UserAvatar(image: image, backgroundImage: backgroundAvatar),
            const SizedBox(height: SpacingUnit.x4),
            Text(
              userName,
              style: theme.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w700, color: colors.textLight),
            ),
            const SizedBox(height: SpacingUnit.x1),
            Text(
              role,
              style: theme.textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600, color: colors.textSecondary),
            )
          ],
        ),
      ),
    );
  }
}
