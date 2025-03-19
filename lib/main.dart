import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/utils/app_config_utils.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/init.dart';

Future<void> main() async {
  final env = await AppConfigUtils.getConfigFromEnv(Assets.env.envUat);
  setConfig(env);
  await initApp();
}
