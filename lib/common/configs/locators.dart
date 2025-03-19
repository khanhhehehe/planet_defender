import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locators.config.dart';

final dI = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => dI.init();
