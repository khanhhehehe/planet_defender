import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/navigation.dart';
import 'package:planet_defender/common/routers/pages.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_state.dart';
import 'package:planet_defender/presentations/bloc/user/user_bloc.dart';
import 'package:planet_defender/presentations/bloc/user/user_state.dart';
import 'package:base_themes/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpBar extends StatefulWidget {
  const ExpBar({super.key});

  @override
  State<ExpBar> createState() => _ExpBarState();
}

class _ExpBarState extends State<ExpBar> {
  @override
  void initState() {
    String studentId = dI<UserBloc>().state.userInfo.studentId;
    dI<PersonalInfoBloc>().add(InitPersonalInfo(studentId: studentId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = BaseThemeColor.of(context);
    final theme = Theme.of(context).textTheme;
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
      builder: (context, state) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            return SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.06,
              child: Stack(
                children: [
                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 1.57,
                    bottom: MediaQuery.sizeOf(context).height / 13,
                    child: Image.asset(Assets.images.levelBg.path,
                        width: MediaQuery.sizeOf(context).width / 4,
                        fit: BoxFit.fitWidth),
                  ),
                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 1.5,
                    bottom: MediaQuery.sizeOf(context).height / 12,
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 5.5,
                        child: Center(
                            child: Text(
                          "Lv ${state.level}",
                          style: theme.bodyLarge!.copyWith(
                              color: colors.surfaceContainer,
                              fontWeight: FontWeight.bold),
                        ))),
                  ),
                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 1.639,
                    bottom: MediaQuery.sizeOf(context).height / 10.4,
                    child: Image.asset(Assets.images.expBg.path,
                        width: MediaQuery.sizeOf(context).width / 20,
                        fit: BoxFit.fitWidth),
                  ),
                  //name
                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 12.5,
                    bottom: MediaQuery.sizeOf(context).height / 27,
                    child: Image.asset(
                      Assets.images.nameBg.path,
                      height: MediaQuery.sizeOf(context).width / 4,
                      width: MediaQuery.sizeOf(context).width / 1.55,
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 4.5,
                    top: MediaQuery.sizeOf(context).height / 100,
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2.8,
                        child: Center(
                            child: Text(
                          userState.userInfo.nickName,
                          style: theme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ))),
                  ),
                  //coin
                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 12,
                    top: MediaQuery.sizeOf(context).height / 33,
                    child: Image.asset(Assets.images.cointBg.path,
                        width: MediaQuery.sizeOf(context).width / 1.29,
                        height: MediaQuery.sizeOf(context).width / 4.2,
                        fit: BoxFit.fitWidth),
                  ),
                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 3.5,
                    top: MediaQuery.sizeOf(context).height / 14,
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2.8,
                        child: Center(
                            child: Row(
                          children: [
                            SizedBox(
                                width: 30,
                                height: 30,
                                child: Image.asset(
                                  Assets.images.coin.path,
                                  fit: BoxFit.fitWidth,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                state.fselCoin.toString(),
                                style: theme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ))),
                  ),

                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 6.4,
                    bottom: MediaQuery.sizeOf(context).height / 30,
                    child: Image.asset(Assets.images.expBar.path,
                        width: MediaQuery.sizeOf(context).width / 1.35,
                        fit: BoxFit.fitWidth),
                  ),
                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 6.4,
                    bottom: MediaQuery.sizeOf(context).height / 30,
                    child: Image.asset(Assets.images.expBar.path,
                        width: MediaQuery.sizeOf(context).width / 1.35,
                        fit: BoxFit.fitWidth),
                  ),
                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 1.44,
                    child: InkWell(
                      onTap: () => dI<AppNavigation>()
                          .push(context, page: Pages.settingScreen),
                      child: Image.asset(Assets.images.setting.path,
                          width: MediaQuery.sizeOf(context).width / 4.2,
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: () {
                        dI<AppNavigation>()
                            .push(context, page: Pages.personalInfo);
                      },
                      child: Image.asset(Assets.images.avatarBg.path,
                          width: MediaQuery.sizeOf(context).width / 4,
                          height: MediaQuery.sizeOf(context).width / 4,
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
