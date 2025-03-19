import 'package:planet_defender/app.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/presentations/bloc/main_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await _initHydratedBloc();
  runApp(const _InitApp());
}

Future<void> _initHydratedBloc() async {
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());
}

class _InitApp extends StatelessWidget {
  const _InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MainBloc.allBlocs(),
      child: const App(),
    );
  }
}
