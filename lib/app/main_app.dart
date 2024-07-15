import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/theme.dart';

import '../core/routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      routerConfig: router,
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
