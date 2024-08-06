import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static late Box _settingsBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    _settingsBox = await Hive.openBox('settings');
  }

  static dynamic getSetting(String key, {dynamic defaultValue}) {
    return _settingsBox.get(key, defaultValue: defaultValue);
  }

  static Future<void> putSetting(String key, dynamic value) async {
    await _settingsBox.put(key, value);
  }

  static Future<void> deleteSetting(String key) async {
    await _settingsBox.delete(key);
  }
}