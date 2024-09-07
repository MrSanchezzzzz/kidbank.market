import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/custom_modal_bottom_sheet.dart';
import 'package:kidbank/core/widgets/main_page_title.dart';
import 'package:kidbank/features/catalogue/data/catalogue_riverpod.dart';
import 'package:kidbank/features/catalogue/data/filter_riverpod.dart';
import 'package:kidbank/core/widgets/toys/toys_view.dart';
import 'package:kidbank/core/widgets/main_navbar.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/filter_modal_sheet.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/photo_search_modal_sheet.dart';
import 'package:kidbank/core/widgets/toys/view_type_button.dart';

import '../../../core/colors.dart';
import '../../../core/widgets/filter/filter_button.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white100,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MainNavbar(),
              MainPageHeader(
                title: 'Catalogue',
                trailing: FilterButton(
                  onTap: (){
                    FilterModalSheet.show(context,title: 'Toy\'s filter');
                    },
                ),
              ),
              const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer(
                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      int filtersCount=ref.watch(filterProvider).count;
                      return Text(filtersCount==0?'No filters were applied':'$filtersCount filters applied',
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 15,color: Colors.grey300
                        ),
                      );
                    },
                  ),
                  const ViewTypeButton(),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    color: Colors.white100,
                    child: ToysView(provider: catalogueProvider,)
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
