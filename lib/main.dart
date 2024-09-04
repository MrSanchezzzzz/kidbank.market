import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'app/main_app.dart';
import 'core/setting_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  runApp(
    const ProviderScope(
      child: OverlaySupport.global(
        child: MainApp(),
      ),
    ),
  );
}