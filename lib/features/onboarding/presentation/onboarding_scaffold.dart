import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/step_progressbar.dart';

import '../../../core/widgets/main_back_button.dart';
import '../../../core/widgets/main_button.dart';

class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({super.key,required this.title,required this.currentStep,this.onBack,this.onNext,this.child,this.finish=false});
  final String title;
  final int currentStep;
  final Function()? onBack;
  final Function()? onNext;
  final Widget? child;
  final bool finish;
  @override
  Widget build(BuildContext context) {
  final List<String> steps=['Profile','Add a toy','Explore','Currency'];
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainBackButton(label: 'Skip'),
            ],
          ),
          middle: Text(title),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                    children: [
                      StepProgressbar(stepCount: steps.length, stepLabels: steps,currentStep: currentStep,),
                      child??Container(),
                    ],
                  )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: MainButton(text: 'Back',onTap: onBack,
                    color: CupertinoTheme.of(context).scaffoldBackgroundColor,)),
                  const SizedBox(width: 16,),
                  Expanded(child: MainButton(text:finish?'Finish':'Next',onTap: onNext),)
                ],
              ),
            ],
          ),
        )
    );
  }
}
