import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      localizationsDelegates: const [
        DefaultCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate
      ],
    );
  }
}
