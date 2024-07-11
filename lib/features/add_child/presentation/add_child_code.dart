
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/step_progressbar.dart';

import '../../../core/widgets/main_back_button.dart';
import '../utils/step_labels.dart';

class AddChildCodeScreen extends StatelessWidget {
  const AddChildCodeScreen({super.key,required this.count,required this.currentIndex});
  final int count;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    int childIndex=currentIndex;
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MainBackButton(label: 'Back'),
            ],
          ),
          middle: Text('Add child'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 8,),
                  StepProgressbar(stepCount: count+1, stepLabels: generateStepsLabels(count),currentStep: currentIndex,),
                  const SizedBox(height: 16),
                  Text('Enter the following verification code to the child’s application/Share the QR code with your child so he/she can link account',
                        style: CupertinoTheme.of(context).textTheme.textStyle,
                        textAlign: TextAlign.center,
                      ),
                  const SizedBox(height: 16,),
                  Text('899 - 011',style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
                  const SizedBox(height: 16,),
                  Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),color: Color(0xFFD9D9D9)),
                    padding: const EdgeInsets.all(8),
                    child: const Placeholder(),
                  ),
                ],
              ),
              MainButton(text:'Next',
                onTap: (){
                  context.push('/add_child/nickname',extra: {'count':count,'currentIndex':childIndex});},
              )
            ],
          ),
        )
    );
  }
}
