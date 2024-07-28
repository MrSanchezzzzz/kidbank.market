import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/step_progressbar.dart';

class IdCheker extends StatelessWidget {
  const IdCheker({
    super.key,
    required this.title,
    required this.currentStep,
    this.onBack,
    this.onNext,
    this.child,
    this.finish = false,
    this.skip,
    required this.nextB,
  });
  final String title;
  final int currentStep;
  final Function()? onBack;
  final Function()? onNext;
  final Widget? child;
  final bool finish;
  final String? skip;
  final String nextB;
  @override
  Widget build(BuildContext context) {
    final List<String> steps = ['Chose', 'Data', 'Photo', 'Finish'];
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          border: const Border(bottom: BorderSide.none),
          leading: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainBackButton(label: 'Back'),
            ],
          ),
          middle: Text(title),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                children: [
                  StepProgressbar(
                    stepCount: steps.length,
                    stepLabels: steps,
                    currentStep: currentStep,
                  ),
                  child ?? Container(),
                ],
              )),
              Column(
                children: [
                  MainButton(
                    text: skip,
                    onTap: () {},
                    color: Colors.purple50,
                  ),
                  const SizedBox(height: 10),
                  MainButton(text: nextB, onTap: onNext),
                ],
              ),
            ],
          ),
        ));
  }
}
