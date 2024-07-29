import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/catalogue/data/display_mode_riverpod.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/grid_item.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/list_item.dart';


class CatalogueItemsView extends ConsumerWidget {
  const CatalogueItemsView({super.key});

  Widget _displayItems(bool isGrid){
    //TODO ListView.Builder for different display options
    if(isGrid) {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        children: const [
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
        itemBuilder: (context,index){
          return const CatalogueListItem();
        }
    );
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    bool isGrid=ref.watch(displayModeProvider);
    return _displayItems(isGrid);
  }
}
