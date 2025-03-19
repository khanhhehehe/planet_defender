import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/routers/router.dart';
import 'package:planet_defender/presentations/bloc/themes/theme_cubit.dart';
import 'package:planet_defender/presentations/themes/themes.dart';
import 'package:planet_defender/presentations/widgets/unfocus_gesture_detector_screen_widget.dart';
import 'package:localizations/l10n/app_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<LocalizationsDelegate<dynamic>> get _getLocalizationsDelegates {
    return const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  Locale? _localeResolutionCallback(locale, supportedLocales) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale!.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppMode>(builder: (context, mode) {
      return KeyboardVisibilityProvider(
        child: UnfocusGestureDetectorScreen(
          child: MaterialApp.router(
            routerConfig: dI<AppRouters>().goRouter,
            themeMode: ThemeMode.light,
            theme: const AppTheme().lightTheme(context),
            localizationsDelegates: _getLocalizationsDelegates,
            localeResolutionCallback: _localeResolutionCallback,
            supportedLocales: const [
              Locale('en'), // us
            ],
          ),
        ),
      );
    });
  }
}
