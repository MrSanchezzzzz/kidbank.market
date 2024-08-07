import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/catalogue/data/filter_riverpod.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/filter_price_select.dart';

import '../../../../core/colors.dart' as project_colors;
import '../../../../core/widgets/custom_text_field.dart';
import 'filter_color_picker.dart';

class FilterModalSheet extends StatefulWidget {
  const FilterModalSheet({super.key});

  @override
  State<FilterModalSheet> createState() => _FilterModalSheetState();
}

class _FilterModalSheetState extends State<FilterModalSheet> {
  List<Color> selectedColors=[];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.5+MediaQuery.of(context).viewInsets.bottom,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          const CustomTextField(
            label: 'Categories',
            placeholder: 'Choose categories',
          ),
          const CustomTextField(
            label: 'Age',
            placeholder: 'Choose age',
          ),
          Text(
            'Color',
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 15,
              color: project_colors.Colors.grey500,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8,),
          FilterColorPicker(onSelected: (value){
            selectedColors=value;
            },
          ),
          const SizedBox(height: 16,),
          const FilterPriceSelect(),
          const SizedBox(height: 16,),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return MainButton(text: 'Apply filters',onTap:(){
                ref.read(filterProvider.notifier).setColors(selectedColors);
                Navigator.of(context).pop();
              },
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          )
        ],
      ),
    );
  }
}
