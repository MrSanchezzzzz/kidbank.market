import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/filter_price_select.dart';

import '../../../../core/colors.dart' as project_colors;
import '../../../../core/widgets/custom_text_field.dart';
import 'filter_color_picker.dart';

class FilterModalSheet extends StatelessWidget {
  const FilterModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.5+MediaQuery.of(context).viewInsets.bottom,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          CustomTextField.search(
            showCamera: false,
          ),
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
          const FilterColorPicker(),
          const SizedBox(height: 16,),
          const FilterPriceSelect(),
          const SizedBox(height: 16,),
          MainButton(text: 'Apply filters',onTap:(){
            Navigator.of(context).pop();
          },),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          )
        ],
      ),
    );
  }
}
