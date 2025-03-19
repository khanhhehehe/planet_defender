import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/presentations/bloc/activities/activities_bloc.dart';
import 'package:planet_defender/presentations/bloc/auth/auth_bloc.dart';
import 'package:planet_defender/presentations/bloc/auth_screens/auth_screens_bloc.dart';
import 'package:planet_defender/presentations/bloc/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:planet_defender/presentations/bloc/buff/buff_bloc.dart';
import 'package:planet_defender/presentations/bloc/character/character_bloc.dart';
import 'package:planet_defender/presentations/bloc/countdown_time/countdown_time_bloc.dart';
import 'package:planet_defender/presentations/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_history/game_history_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_play/fire_bloc/fire_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_play/game_play_bloc/game_play_bloc.dart';
import 'package:planet_defender/presentations/bloc/game_play/meteorite_bloc/meteorite_bloc.dart';
import 'package:planet_defender/presentations/bloc/key_board/keyboard_bloc.dart';
import 'package:planet_defender/presentations/bloc/login/login_bloc.dart';
import 'package:planet_defender/presentations/bloc/market_place/characters/characters_bloc.dart';
import 'package:planet_defender/presentations/bloc/market_place/spaceships/spaceships_bloc.dart';
import 'package:planet_defender/presentations/bloc/personal_info/personal_info_bloc.dart';
import 'package:planet_defender/presentations/bloc/question/question_bloc.dart';
import 'package:planet_defender/presentations/bloc/register/register_bloc.dart';
import 'package:planet_defender/presentations/bloc/setting/setting_bloc.dart';
import 'package:planet_defender/presentations/bloc/status_buy/status_buy_bloc.dart';
import 'package:planet_defender/presentations/bloc/themes/theme_cubit.dart';
import 'package:planet_defender/presentations/bloc/user/user_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/meteorite/wiki_meteorite_bloc.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/space_ship/wiki_spaceship_bloc.dart';
import 'package:planet_defender/presentations/bloc/wiki_book/z_buff/wiki_z_buff_bloc.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() => [
        BlocProvider<ThemeCubit>(
            create: (BuildContext context) => dI<ThemeCubit>()),
        BlocProvider<AuthBloc>(
            create: (BuildContext context) => dI<AuthBloc>()),
        BlocProvider<LoginBloc>(
            create: (BuildContext context) => dI<LoginBloc>()),
        BlocProvider<UserBloc>(
            create: (BuildContext context) => dI<UserBloc>()),
        BlocProvider<RegisterBloc>(
            create: (BuildContext context) => dI<RegisterBloc>()),
        BlocProvider<AuthScreensCubit>(
            create: (BuildContext context) => dI<AuthScreensCubit>()),
        BlocProvider<CountdownTimeBloc>(
            create: (BuildContext context) => dI<CountdownTimeBloc>()),
        BlocProvider<ForgotPasswordBloc>(
            create: (BuildContext context) => dI<ForgotPasswordBloc>()),
        BlocProvider<CharacterBloc>(
            create: (BuildContext context) => dI<CharacterBloc>()),
        BlocProvider<MeteoriteBloc>(
            create: (BuildContext context) => dI<MeteoriteBloc>()),
        BlocProvider<FireBloc>(
            create: (BuildContext context) => dI<FireBloc>()),
        BlocProvider<GamePlayBloc>(
            create: (BuildContext context) => dI<GamePlayBloc>()),
        BlocProvider<GameHistoryBloc>(
            create: (BuildContext context) => dI<GameHistoryBloc>()),
        BlocProvider<QuestionBloc>(
            create: (BuildContext context) => dI<QuestionBloc>()),
        BlocProvider<KeyboardBloc>(
            create: (BuildContext context) => dI<KeyboardBloc>()),
        BlocProvider<PersonalInfoBloc>(
            create: (BuildContext context) => dI<PersonalInfoBloc>()),
        BlocProvider<BuffBloc>(
            create: (BuildContext context) => dI<BuffBloc>()),
        BlocProvider<SettingBloc>(
          create: (context) => dI<SettingBloc>(),
        ),
        BlocProvider<ActivitiesBloc>(create: (context) => dI<ActivitiesBloc>()),
        BlocProvider<SpaceshipsBloc>(
          create: (context) => dI<SpaceshipsBloc>(),
        ),
        BlocProvider<CharactersBloc>(
          create: (context) => dI<CharactersBloc>(),
        ),
        BlocProvider<StatusBuyBloc>(
          create: (context) => dI<StatusBuyBloc>(),
        ),
        BlocProvider<WikiZBuffBloc>(create: (context) => dI<WikiZBuffBloc>()),
        BlocProvider<WikiSpaceshipsBloc>(
            create: (context) => dI<WikiSpaceshipsBloc>()),
        BlocProvider<WikiMeteoriteBloc>(
            create: (context) => dI<WikiMeteoriteBloc>()),
        BlocProvider<BottomNavigationCubit>(
            create: (context) => dI<BottomNavigationCubit>()),
      ];
}
