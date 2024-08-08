import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/custom_modal_bottom_sheet.dart';
import 'package:kidbank/features/catalogue/data/filter_riverpod.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_items_view.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_navbar.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/filter_modal_sheet.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/photo_search_modal_sheet.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/view_type_button.dart';

import '../../../core/colors.dart' as project_colors;
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/filter_button.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});


  void showFilterModal(BuildContext context) {
    CustomModalBottomSheet.show(
        context: context,
        sheet: const CustomModalBottomSheet(
          title: 'Toy\'s filter',
          body: FilterModalSheet(),
        ));
  }

  void showPhotoSearchModal(BuildContext context) {
    CustomModalBottomSheet.show(
        context: context,
        sheet: const CustomModalBottomSheet(
          title: 'Toy\'s filter',
          body: PhotoSearchModalSheet(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CatalogueNavbar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Catalogue',
                  style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(fontSize: 34),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField.search(
                        onCameraTap: (){
                          showPhotoSearchModal(context);
                        },
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18,top: 12),
                        child: FilterButton(onTap: (){showFilterModal(context);},),
                      )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: project_colors.Colors.white100,
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer(
                            builder: (BuildContext context, WidgetRef ref, Widget? child) {
                              int filtersCount=ref.watch(filterProvider).count;
                              return Text(filtersCount==0?'No filters were applied':'$filtersCount filters applied',
                                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                  fontSize: 15,color: project_colors.Colors.grey300
                                ),
                              );
                            },
                          ),
                          ViewTypeButton(
                            onTap: (isGrid) {
                              //TODO change display type
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Expanded(child: CatalogueItemsView())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
