import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/models/categories.dart';
import 'package:kidbank/core/models/toy_property.dart';
import 'package:kidbank/core/widgets/ui_card.dart';
import 'package:kidbank/features/list_toy/data/selected_category_riverpod.dart';
import 'package:kidbank/features/list_toy/presentation/widgets/category_card.dart';

import '../../data/toy_listing_riverpod.dart';

class CategoriesGridView extends ConsumerWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ToyProperty? selectedCategory = ref.watch(selectedCategoryProvider);
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 18,
      childAspectRatio: 2,
      children: List<Widget>.generate(Categories.values.length, (index){
        return CategoryCard(
          category: Categories.values[index],
          checked: selectedCategory == Categories.values[index],
          onChanged: () {
            ref.watch(selectedCategoryProvider.notifier).setValue(Categories.values[index]);
          },
        );
      }),
    );
  }
}