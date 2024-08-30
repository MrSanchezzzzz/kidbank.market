import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/main_navbar.dart';
import 'package:kidbank/core/widgets/main_page_title.dart';
import 'package:kidbank/core/widgets/progress_indicator.dart';

import '../../../../core/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white100,
        child: SafeArea(
          child: Column(
            children: [
              const MainNavbar(),
              const MainPageHeader(title: 'Favorites',),
              Expanded(child: ListView())
            ],
          ),
        )
    );
  }
}
