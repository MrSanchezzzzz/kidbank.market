import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/models/toy_property.dart';
import 'package:kidbank/core/widgets/ui_card.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key,required this.category,this.onChanged,this.checked=false});
  final ToyProperty category;
  final Function()? onChanged;
  final bool checked;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: UiCard(
        image: category.image,
        label: category.name,
        checked: checked,
        onChanged: onChanged,
      ),
    );
  }
}
