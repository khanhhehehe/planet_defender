import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

enum AppMode { lightMode, darkMode }

extension AppModeX on AppMode {
  bool get isLightMode => this == AppMode.lightMode;
  bool get isDarkMode => this == AppMode.darkMode;
}

@lazySingleton
class ThemeCubit extends HydratedCubit<AppMode> {
  ThemeCubit() : super(AppMode.lightMode);

  void changeThemeMode() {
    if (state == AppMode.lightMode) {
      emit(AppMode.darkMode);
    } else {
      emit(AppMode.lightMode);
    }
  }

  @override
  AppMode? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AppMode state) {
    return null;
  }
}
