import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/main_navbar.dart';
import 'package:kidbank/core/widgets/main_page_title.dart';
import 'package:kidbank/core/widgets/toys/toys_view.dart';
import 'package:kidbank/core/widgets/toys/view_type_button.dart';
import 'package:kidbank/features/favorites/data/favorites_riverpod.dart';

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
              MainPageHeader(
                title: 'Favorites',
                trailing: GestureDetector(
                  child: Image.asset('assets/images/sort.png',width: 24,height: 24,),
                ),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'No sorting',
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 15,color: Colors.grey300
                        )
                    ),
                    const ViewTypeButton(),
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: ToysView(provider: favoritesProvider,),
              ))
            ],
          ),
        )
    );
  }
}
