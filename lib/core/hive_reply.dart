import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveReply {
  static late Box _replyBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    _replyBox = await Hive.openBox('reply');
  }

  static dynamic getNotify(String key, {dynamic defaultValue}) {
    return _replyBox.get(key, defaultValue: defaultValue);
  }

  static Future<void> putNotify(String key, dynamic value) async {
    await _replyBox.put(key, value);
  }

  static Future<void> deleteNotify(String key) async {
    await _replyBox.delete(key);
  }
}