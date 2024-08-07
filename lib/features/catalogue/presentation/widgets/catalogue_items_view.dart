import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/catalogue/data/display_mode_riverpod.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/grid_item.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/list_item.dart';


class CatalogueItemsView extends ConsumerWidget {
  const CatalogueItemsView({super.key});
  //TODO toys array here
  Widget _displayItems(bool isGrid){
    if(isGrid) {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        children: [
          CatalogueGridItem(),
          CatalogueGridItem(),
          CatalogueGridItem(),
          CatalogueGridItem(),
          CatalogueGridItem(),
          CatalogueGridItem(),
          CatalogueGridItem(),
          CatalogueGridItem(),
        ],
      );
    }
    return ListView.builder(
      itemCount: 8,
        itemBuilder: (context,index){
          return CatalogueListItem();
        }
    );
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    bool isGrid=ref.watch(displayModeProvider);
    return _displayItems(isGrid);
  }
}
