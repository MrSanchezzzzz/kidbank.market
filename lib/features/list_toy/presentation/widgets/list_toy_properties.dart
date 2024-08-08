import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/models/colors.dart';
import '../../data/toy_listing_riverpod.dart';
import 'listing_list_tile.dart';

class ListToyProperties extends StatelessWidget {
  const ListToyProperties({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListingListTile(
          title: 'Category',
          onTap: null, //TODO onTap,
          provider: selectedCategoryProvider,
        ),
        ListingListTile(
          title: 'Age',
          onTap: null, //TODO onTap,
          provider: selectedAgeProvider,
        ),
        const SizedBox(
          height: 4,
        ),
        ListingListTile(
          title: 'Condition',
          onTap: null, //TODO onTap,
          provider: selectedConditionProvider,
        ),
        const SizedBox(
          height: 4,
        ),
        Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ToyColor? color=ref.watch(selectedColorProvider);
          return CupertinoListTile(
            title: const Text('Color'),
            onTap: (){},//TODO onTap
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(color!=null?color.name:'None'),
                const CupertinoListTileChevron()
              ],
            ),
          );
        },
        ),
        const SizedBox(
          height: 4,
        ),
        ListingListTile(
          title: 'Material',
          onTap: null, //TODO onTap,
          provider: selectedMaterialProvider,
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
