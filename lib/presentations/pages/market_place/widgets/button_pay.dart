import 'package:common/utils/spacing_unit.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';

class ButtonPay extends StatelessWidget {
  final int coin;
  final VoidCallback onPress;
  const ButtonPay({super.key, this.coin = 0, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
      builder: (context, state) {
        return Container(
          width: SpacingUnit.x35,
          height: SpacingUnit.x10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpacingUnit.x1),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colors.gradientNavy),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                    color: colors.shadowButton.withOpacity(0.25)),
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    color: colors.shadowButton.withOpacity(0.12)),
                BoxShadow(
                    offset: const Offset(0, 2), color: colors.shadowButton),
              ]),
          child: TextButton(
            onPressed: () => onPress.call(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.images.coin4.path),
                const SizedBox(width: SpacingUnit.x2),
                Text(
                  coin.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: state.fselCoin > coin
                          ? colors.onSurface
                          : colors.error),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
