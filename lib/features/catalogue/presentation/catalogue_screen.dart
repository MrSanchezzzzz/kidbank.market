import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidbank/core/widgets/custom_modal_bottom_sheet.dart';
import 'package:kidbank/core/widgets/tab_selector.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_filters.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_items_view.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_navbar.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/filter_modal_sheet.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/sort_modal_sheet.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/view_type_button.dart';

import '../../../core/colors.dart' as project_colors;

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  void showSortModal(BuildContext context) {
    CustomModalBottomSheet.show(
        context: context,
        sheet: const CustomModalBottomSheet(
          title: 'Photo search',
          body: SortModalSheet(),
        ));
  }

  void showFilterModal(BuildContext context) {
    CustomModalBottomSheet.show(
        context: context,
        sheet: const CustomModalBottomSheet(
          title: 'Toy\'s filter',
          body: FilterModalSheet(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              const CatalogueNavbar(),
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
                            showSortModal(context);
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
                      const TabSelector(
                        labels: ['All toys', 'My toys'],
                        callbacks: [],
                        startIndex: 1,
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
