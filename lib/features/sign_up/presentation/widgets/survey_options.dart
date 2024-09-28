import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/custom_radio_button.dart';
import 'package:kidbank/core/widgets/progress_indicator.dart';
import 'package:kidbank/features/sign_up/data/selected_option_riverpod.dart';
import 'package:kidbank/features/sign_up/data/survey_riverpod.dart';

import '../../../../core/widgets/custom_text_field.dart';

class SurveyOptions extends ConsumerWidget {
  const SurveyOptions({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final surveyOptions=ref.watch(surveyOptionsProvider);
    final selectedOption=ref.watch(selectedSurveyOptionProvider);
    return surveyOptions.when(
        data: (options){
          return Column(
            children: [
              ...List.generate(options.length, (index){
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: CustomRadioButton(
                      value: index,
                      groupValue: selectedOption,
                      label: options[index],
                    onChanged: (val){
                        ref.watch(selectedSurveyOptionProvider.notifier).setValue(val);
                    },
                  ),
                );
              }),
              const CustomTextField(
                placeholder: 'Place for other ideas',
              ),
          ]);
        },
        error: (err,stack)=>const Center(child: Text('Error'),),
        loading: ()=>const Center(child: ProgressIndicator(),));
  }
}
