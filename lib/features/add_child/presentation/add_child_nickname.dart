import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/mascot_info.dart';
import 'package:kidbank/core/widgets/step_progressbar.dart';

import '../../../core/widgets/main_back_button.dart';
import '../../../core/widgets/main_button.dart';
import '../utils/step_labels.dart';

class AddChildNicknameScreen extends StatelessWidget {
  const AddChildNicknameScreen({super.key,required this.count,required this.currentIndex});
  final int count;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    int childIndex=currentIndex;

    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainBackButton(label: 'Back'),

            ],
          ),
          middle: Text('Add child'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                const SizedBox(height: 8,),
                StepProgressbar(stepCount: count+1, stepLabels: generateStepsLabels(count),currentStep: currentIndex,),
                const MascotInfo(text: 'The account\'s linked. Enter your child\'s nickname.',),
                const SizedBox(height: 24,),
                const CupertinoTextField(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: MainButton(text:'Continue',
                    onTap: (){
                      if (++childIndex >= count) {
                        context.go('/add_child/finish',extra: {'count':count});
                        return;
                      }
                      context.push('/add_child/code',extra: {'count':count,'currentIndex':childIndex});
                                        },))
                ],
              ),

            ],
          ),
        )
    );
  }
}
