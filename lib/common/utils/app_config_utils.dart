import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfigUtils {
  static Future<Map<String, String>> _loadEnv(String file) async {
    final dotEnv = DotEnv();
    await dotEnv.load(fileName: file);
    return dotEnv.env;
  }

  static Future<Map<String, String>> getConfigFromEnv(String env) async {
    return await _loadEnv(env);
  }
}
