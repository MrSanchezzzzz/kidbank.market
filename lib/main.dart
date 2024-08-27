import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/hive_reply.dart';
import 'app/main_app.dart';
import 'core/setting_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await HiveReply.init();

  runApp(const ProviderScope(child: MainApp()));
}