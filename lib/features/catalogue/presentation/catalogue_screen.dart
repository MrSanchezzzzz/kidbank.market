import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/tab_selector.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_filters.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_items_view.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_navbar.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/view_type_button.dart';

import '../../../core/colors.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        child: SafeArea(
            child:
            Column(
              children: [
                const CatalogueNavbar(),
                Expanded(
                  child: Container(
                    color: Colors.white100,
                    padding: const EdgeInsets.only(left: 16,top: 16,right: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CatalogueFilters(
                              onSortTap: null,//TODO display sort menu
                              onFilterTap: null,//TODO display filter meny
                            ),
                            ViewTypeButton(onTap: (isGrid){
                              //TODO change display type
                            },),
                          ],
                        ),
                        const SizedBox(height: 16,),
                        const TabSelector(labels: ['All toys','My toys'],callbacks: [],startIndex: 1,),
                        const SizedBox(height: 8,),
                        const Expanded(
                            child: CatalogueItemsView()
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
    );
  }
}
