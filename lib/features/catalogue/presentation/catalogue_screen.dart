import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/custom_modal_bottom_sheet.dart';
import 'package:kidbank/core/widgets/tab_selector.dart';
import 'package:kidbank/features/catalogue/data/display_mode_riverpod.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_filters.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_items_view.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_navbar.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/filter_modal_sheet.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/photo_search_modal_sheet.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/view_type_button.dart';

import '../../../core/colors.dart' as project_colors;
import '../../../core/widgets/custom_text_field.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField.search(
                  onCameraTap: (){
                    showPhotoSearchModal(context);
                  },
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
                          CatalogueFilters(onSortTap: () {
                            //TODO show sort
                          }, onFilterTap: () {
                            showFilterModal(context);
                          }),
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
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          return TabSelector(
                            labels: const ['All toys', 'My toys'],
                            callbacks: [
                              (){ref.read(myToysProvider.notifier).setDisplayMode(true);},
                              (){ref.read(myToysProvider.notifier).setDisplayMode(false);},
                            ],
                            startIndex: 0,
                          );
                        },
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
