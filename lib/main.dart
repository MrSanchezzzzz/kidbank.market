import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'app/main_app.dart';
import 'core/setting_hive.dart';
import 'core/utils/requests.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  //TODO remove when backend will have certificate
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    const ProviderScope(
      child: OverlaySupport.global(
        child: MainApp(),
      ),
    ),
  );
}