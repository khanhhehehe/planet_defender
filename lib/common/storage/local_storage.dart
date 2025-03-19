import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppLocalStorage {
  AppLocalStorage._privateConstructor();

  static final AppLocalStorage _secureStorageApp =
      AppLocalStorage._privateConstructor();
  factory AppLocalStorage() {
    return _secureStorageApp;
  }

  static saveData(String? key, var value) async {
    var storage = const FlutterSecureStorage();
    String s = value.toString();
    await storage.write(key: key!, value: s);
  }

  static Future<String?> getData(String? key) async {
    var storage = const FlutterSecureStorage();
    return await storage.read(key: key!);
  }

  static Future<void> clearByKey(String key) async {
    var storage = const FlutterSecureStorage();
    return await storage.delete(key: key);
  }

  static clearAll() async {
    var storage = const FlutterSecureStorage();
    return await storage.deleteAll();
  }
}
