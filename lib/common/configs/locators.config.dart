// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories/activities_game.repository.implement.dart'
    as _i5;
import '../../data/repositories/auth.repository.implement.dart' as _i14;
import '../../data/repositories/character.repository.implement.dart' as _i23;
import '../../data/repositories/game_history.implement.dart' as _i37;
import '../../data/repositories/personal.repository.implement.dart' as _i50;
import '../../data/repositories/questions.repository.implement.dart' as _i57;
import '../../data/repositories/select_character.repository.implement.dart'
    as _i66;
import '../../data/repositories/spaceship.repository.implement.dart' as _i73;
import '../../data/repositories/user.repository.implement.dart' as _i83;
import '../../data/repositories/wiki_z_buff.repository.implement.dart' as _i94;
import '../../data/services/activities_game.service.implement.dart' as _i7;
import '../../data/services/auth.service.implement.dart' as _i17;
import '../../data/services/base.service.dart' as _i30;
import '../../data/services/character.service.implement.dart' as _i25;
import '../../data/services/game_history.service.implement.dart' as _i39;
import '../../data/services/personal_info.service.implement.dart' as _i54;
import '../../data/services/questions.service.implement.dart' as _i59;
import '../../data/services/select_character.service.implement.dart' as _i68;
import '../../data/services/spaceships.service.implement.dart' as _i75;
import '../../data/services/user.service.implement.dart' as _i85;
import '../../data/services/wiki_z_buff.service.implement.dart' as _i96;
import '../../data/use_cases/activities_game_usecase.implement.dart' as _i9;
import '../../data/use_cases/character_usecase.implement.dart' as _i27;
import '../../data/use_cases/forgot_password_usecase.implement.dart' as _i34;
import '../../data/use_cases/game_history_usecase.implement.dart' as _i41;
import '../../data/use_cases/login_usecase.implement.dart' as _i46;
import '../../data/use_cases/personal_info_usecase.implement.dart' as _i52;
import '../../data/use_cases/questions_usecase.implement.dart' as _i61;
import '../../data/use_cases/register_usecase.implement.dart' as _i64;
import '../../data/use_cases/select_character_usecase.implement.dart' as _i70;
import '../../data/use_cases/spaceship_usecase.implement.dart' as _i77;
import '../../data/use_cases/user_usecase.implement.dart' as _i87;
import '../../data/use_cases/wiki_spaceship_usecase.implement.dart' as _i90;
import '../../data/use_cases/wiki_z_buff_usecase.implement.dart' as _i98;
import '../../domain/repositories/activities_game.repository.dart' as _i4;
import '../../domain/repositories/auth.repository.dart' as _i13;
import '../../domain/repositories/character.repository.dart' as _i22;
import '../../domain/repositories/game_history.dart' as _i36;
import '../../domain/repositories/personal.repository.dart' as _i49;
import '../../domain/repositories/questions.repository.dart' as _i56;
import '../../domain/repositories/select_character.repository.dart' as _i65;
import '../../domain/repositories/spaceship.reposity.dart' as _i72;
import '../../domain/repositories/user.repositories.dart' as _i82;
import '../../domain/repositories/wiki_z_buff.repository.dart' as _i93;
import '../../domain/services/activities_game.service.dart' as _i6;
import '../../domain/services/auth.service.dart' as _i16;
import '../../domain/services/character.service.dart' as _i24;
import '../../domain/services/game_history.service.dart' as _i38;
import '../../domain/services/personal.service.dart' as _i53;
import '../../domain/services/questions.service.dart' as _i58;
import '../../domain/services/select_character_service.dart' as _i67;
import '../../domain/services/spaceship.service.dart' as _i74;
import '../../domain/services/user.service.dart' as _i84;
import '../../domain/services/wiki_z_buff.service.dart' as _i95;
import '../../domain/use_cases/activities_game.usecase.dart' as _i8;
import '../../domain/use_cases/character_usecase.dart' as _i26;
import '../../domain/use_cases/forgot_password_usecase.dart' as _i33;
import '../../domain/use_cases/game_history_usecase.dart' as _i40;
import '../../domain/use_cases/login_usecase.dart' as _i45;
import '../../domain/use_cases/personal_info_usecase.dart' as _i51;
import '../../domain/use_cases/questions_usecase.dart' as _i60;
import '../../domain/use_cases/register_usecase.dart' as _i63;
import '../../domain/use_cases/select_character.dart' as _i69;
import '../../domain/use_cases/spaceship_usecase.dart' as _i76;
import '../../domain/use_cases/user_usecase.dart' as _i86;
import '../../domain/use_cases/wiki_spaceship_usecase.dart' as _i89;
import '../../domain/use_cases/wiki_zbuff_usecase.dart' as _i97;
import '../../presentations/bloc/activities/activities_bloc.dart' as _i3;
import '../../presentations/bloc/auth/auth_bloc.dart' as _i12;
import '../../presentations/bloc/auth_screens/auth_screens_bloc.dart' as _i15;
import '../../presentations/bloc/bottom_navigation/bottom_navigation_cubit.dart'
    as _i18;
import '../../presentations/bloc/buff/buff_bloc.dart' as _i19;
import '../../presentations/bloc/change_password/change_password_bloc.dart'
    as _i20;
import '../../presentations/bloc/character/character_bloc.dart' as _i21;
import '../../presentations/bloc/countdown_time/countdown_time_bloc.dart'
    as _i29;
import '../../presentations/bloc/forgot_password/forgot_password_bloc.dart'
    as _i32;
import '../../presentations/bloc/game_history/game_history_bloc.dart' as _i35;
import '../../presentations/bloc/game_play/fire_bloc/fire_bloc.dart' as _i31;
import '../../presentations/bloc/game_play/game_play_bloc/game_play_bloc.dart'
    as _i42;
import '../../presentations/bloc/game_play/meteorite_bloc/meteorite_bloc.dart'
    as _i47;
import '../../presentations/bloc/key_board/keyboard_bloc.dart' as _i43;
import '../../presentations/bloc/login/login_bloc.dart' as _i44;
import '../../presentations/bloc/market_place/characters/characters_bloc.dart'
    as _i28;
import '../../presentations/bloc/market_place/spaceships/spaceships_bloc.dart'
    as _i78;
import '../../presentations/bloc/personal_info/personal_info_bloc.dart' as _i48;
import '../../presentations/bloc/question/question_bloc.dart' as _i55;
import '../../presentations/bloc/register/register_bloc.dart' as _i62;
import '../../presentations/bloc/setting/setting_bloc.dart' as _i71;
import '../../presentations/bloc/status_buy/status_buy_bloc.dart' as _i79;
import '../../presentations/bloc/themes/theme_cubit.dart' as _i80;
import '../../presentations/bloc/user/user_bloc.dart' as _i81;
import '../../presentations/bloc/wiki_book/meteorite/wiki_meteorite_bloc.dart'
    as _i88;
import '../../presentations/bloc/wiki_book/space_ship/wiki_spaceship_bloc.dart'
    as _i91;
import '../../presentations/bloc/wiki_book/z_buff/wiki_z_buff_bloc.dart'
    as _i92;
import '../routers/navigation.dart' as _i10;
import '../routers/router.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ActivitiesBloc>(() => _i3.ActivitiesBloc());
    gh.lazySingleton<_i4.ActivitiesGameRepository>(
        () => _i5.ActivitiesGameRepositoryImpl());
    gh.lazySingleton<_i6.ActivitiesGameService>(
        () => _i7.ActivitiesGameServiceImpl());
    gh.lazySingleton<_i8.ActivitiesGameUseCase>(
        () => _i9.ActivitiesGameUseCaseImpl());
    gh.lazySingleton<_i10.AppNavigation>(() => _i10.AppNavigation());
    gh.lazySingleton<_i11.AppRouters>(() => _i11.AppRouters());
    gh.lazySingleton<_i12.AuthBloc>(() => _i12.AuthBloc());
    gh.lazySingleton<_i13.AuthRepository>(() => _i14.AuthRepositoryImpl());
    gh.lazySingleton<_i15.AuthScreensCubit>(() => _i15.AuthScreensCubit());
    gh.lazySingleton<_i16.AuthService>(() => _i17.AuthServiceImpl());
    gh.lazySingleton<_i18.BottomNavigationCubit>(
        () => _i18.BottomNavigationCubit());
    gh.lazySingleton<_i19.BuffBloc>(() => _i19.BuffBloc());
    gh.lazySingleton<_i20.ChangePasswordBloc>(() => _i20.ChangePasswordBloc());
    gh.lazySingleton<_i21.CharacterBloc>(() => _i21.CharacterBloc());
    gh.lazySingleton<_i22.CharacterRepository>(
        () => _i23.CharacterRepositoryImpl());
    gh.lazySingleton<_i24.CharacterService>(() => _i25.CharacterServiceImpl());
    gh.lazySingleton<_i26.CharacterUseCase>(() => _i27.CharacterUseCaseImpl());
    gh.lazySingleton<_i28.CharactersBloc>(() => _i28.CharactersBloc());
    gh.lazySingleton<_i29.CountdownTimeBloc>(() => _i29.CountdownTimeBloc());
    gh.lazySingleton<_i30.CustomClient>(() => _i30.CustomClient());
    gh.lazySingleton<_i31.FireBloc>(() => _i31.FireBloc());
    gh.lazySingleton<_i32.ForgotPasswordBloc>(() => _i32.ForgotPasswordBloc());
    gh.lazySingleton<_i33.ForgotPasswordUseCase>(
        () => _i34.ForgotPasswordUseCaseImpl());
    gh.lazySingleton<_i35.GameHistoryBloc>(() => _i35.GameHistoryBloc());
    gh.lazySingleton<_i36.GameHistoryRepository>(() => _i37.GameHistoryImpl());
    gh.lazySingleton<_i38.GameHistoryService>(
        () => _i39.GameHistoryServiceImpl());
    gh.lazySingleton<_i40.GameHistoryUseCase>(
        () => _i41.GameHistoryUseCaseImpl());
    gh.lazySingleton<_i42.GamePlayBloc>(() => _i42.GamePlayBloc());
    gh.lazySingleton<_i43.KeyboardBloc>(() => _i43.KeyboardBloc());
    gh.lazySingleton<_i44.LoginBloc>(() => _i44.LoginBloc());
    gh.lazySingleton<_i45.LoginUseCase>(() => _i46.LoginUseCaseImpl());
    gh.lazySingleton<_i47.MeteoriteBloc>(() => _i47.MeteoriteBloc());
    gh.lazySingleton<_i48.PersonalInfoBloc>(() => _i48.PersonalInfoBloc());
    gh.lazySingleton<_i49.PersonalInfoRepository>(
        () => _i50.PersonalInfoRepositoryImpl());
    gh.lazySingleton<_i51.PersonalInfoUseCase>(() => _i52.PersonalUseCaseImp());
    gh.lazySingleton<_i53.PersonalService>(() => _i54.PersonalInfoServiceImp());
    gh.lazySingleton<_i55.QuestionBloc>(() => _i55.QuestionBloc());
    gh.lazySingleton<_i56.QuestionsRepository>(
        () => _i57.QuestionsRepositoryImpl());
    gh.lazySingleton<_i58.QuestionsService>(() => _i59.QuestionsServiceImpl());
    gh.lazySingleton<_i60.QuestionsUseCase>(() => _i61.QuestionUseCaseImpl());
    gh.lazySingleton<_i62.RegisterBloc>(() => _i62.RegisterBloc());
    gh.lazySingleton<_i63.RegisterUseCase>(() => _i64.RegisterUseCaseImpl());
    gh.lazySingleton<_i65.SelectCharacterRepository>(
        () => _i66.SelectCharacterRepositoryImpl());
    gh.lazySingleton<_i67.SelectCharacterService>(
        () => _i68.SelectCharacterServiceImpl());
    gh.lazySingleton<_i69.SelectCharacterUseCase>(
        () => _i70.SelectCharacterUseCaseImpl());
    gh.lazySingleton<_i71.SettingBloc>(() => _i71.SettingBloc());
    gh.lazySingleton<_i72.SpaceshipRepository>(
        () => _i73.SpaceshipRepositoryImpl());
    gh.lazySingleton<_i74.SpaceshipService>(() => _i75.SpaceshipServiceImpl());
    gh.lazySingleton<_i76.SpaceshipUseCase>(() => _i77.SpaceshipUseCaseImpl());
    gh.lazySingleton<_i78.SpaceshipsBloc>(() => _i78.SpaceshipsBloc());
    gh.lazySingleton<_i79.StatusBuyBloc>(() => _i79.StatusBuyBloc());
    gh.lazySingleton<_i80.ThemeCubit>(() => _i80.ThemeCubit());
    gh.lazySingleton<_i81.UserBloc>(() => _i81.UserBloc());
    gh.lazySingleton<_i82.UserRepository>(() => _i83.UserRepositoryImpl());
    gh.lazySingleton<_i84.UserService>(() => _i85.UserServiceImpl());
    gh.lazySingleton<_i86.UserUseCase>(() => _i87.UserUseCaseImpl());
    gh.lazySingleton<_i88.WikiMeteoriteBloc>(() => _i88.WikiMeteoriteBloc());
    gh.lazySingleton<_i89.WikiSpaceshipUseCase>(
        () => _i90.WikiSpaceshipUseCaseImpl());
    gh.lazySingleton<_i91.WikiSpaceshipsBloc>(() => _i91.WikiSpaceshipsBloc());
    gh.lazySingleton<_i92.WikiZBuffBloc>(() => _i92.WikiZBuffBloc());
    gh.lazySingleton<_i93.WikiZBuffRepository>(
        () => _i94.WikiZBuffRepositoryImpl());
    gh.lazySingleton<_i95.WikiZBuffService>(() => _i96.WikiZBuffServiceImpl());
    gh.lazySingleton<_i97.WikiZBuffUseCase>(() => _i98.WikiZBuffUseCaseImpl());
    return this;
  }
}
