import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/step_progressbar.dart';

import '../../../core/widgets/main_back_button.dart';
import '../utils/step_labels.dart';

class AddChildFinishScreen extends StatelessWidget {
  const AddChildFinishScreen({super.key,required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MainBackButton(
              label: 'Back',
            )
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                StepProgressbar(stepCount: count+1, stepLabels: generateStepsLabels(count),currentStep: count,),
                const SizedBox(height: 24,),
                const Text('We\'ve finished setting up!')
              ],
            ),
           MainButton(text: 'Finish!',onTap: (){/*TODO*/},)
          ],
        ),
      ),
    );
  }
}
