import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/catalogue/data/display_mode_riverpod.dart';
import 'package:kidbank/core/widgets/toy/grid_item.dart';
import 'package:kidbank/core/widgets/toy/list_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/colors.dart';


class CatalogueItemsView extends ConsumerWidget {
  const CatalogueItemsView({super.key,required this.provider});
  final FutureProvider<int> provider;
  //TODO toys array here
  Widget _displayItems(bool isGrid){
    if(isGrid) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            childAspectRatio: 0.7,
            mainAxisSpacing: 8,
          ),
          itemCount: 8,
          itemBuilder: (context,index)=>const CatalogueGridItem());
    }
    return ListView.builder(
      itemCount: 8,
        itemBuilder: (context,index){
          return const CatalogueListItem();
        }
    );
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    bool isGrid=ref.watch(displayModeProvider);
    final toys=ref.watch(provider);
    return toys.when(
        data: (data) =>_displayItems(isGrid),
        error: (_,__)=>const Center(child: Text('Error'),),
        loading: (){
          if(isGrid){
            return Skeletonizer(
              effect: ShimmerEffect(
                baseColor: Colors.grey100
              ),
              enabled: true,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.65,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 8,
                  itemBuilder: (context,index)=>const CatalogueGridItem()),
            );
          }
          return Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey100
            ),
            enabled: true,
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context,index){
                  return const CatalogueListItem();
                }
            ),
          );
        }
    );
  }
}
