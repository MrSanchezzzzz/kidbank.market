import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/filter_button.dart';
import 'package:kidbank/core/widgets/sort_button.dart';

class CatalogueFilters extends StatelessWidget {
  const CatalogueFilters({super.key,this.onSortTap,this.onFilterTap});
  final Function()? onSortTap;
  final Function()? onFilterTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SortButton(sortBy: 'price',onTap: onSortTap,),
        const SizedBox(width: 12,),
        FilterButton(count: 1008,onTap: onFilterTap,)
      ],
    );
  }
}
