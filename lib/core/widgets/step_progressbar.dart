import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidbank/core/widgets/progress_indicators.dart';

class StepProgressbar extends StatelessWidget {
  const StepProgressbar({
    super.key,
    required this.stepCount,
    this.currentStep = 0,
    required this.stepLabels,
  }) : assert(stepCount == stepLabels.length);

  final int stepCount;
  final int currentStep;
  final List<String> stepLabels;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildProgressLines(),
        _buildStepTabs(context),
      ],
    );
  }

  Widget _buildProgressLines() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(stepCount - 1, (i) => Flexible(
        child: Container(
          color: i >= currentStep ? const Color(0xFF9E9E9E) : const Color(0xFF451690),
          margin: EdgeInsets.only(
            top: 10,
            left: i == 0 ? 20 : 0,
            right: i == stepCount - 2 ? 20 : 0,
          ),
          height: 1,
        ),
      )),
    );
  }

  Widget _buildStepTabs(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(stepCount, (i) {
        final Color fontColor = i > currentStep ? const Color(0xFF616161) : const Color(0xFF766691);
        return Column(
          children: [
            _buildStepCircle(context, i),
            Text(
              stepLabels[i],
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 12, color: fontColor),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildStepCircle(BuildContext context, int index) {
    if (index < currentStep) {
      return ProgressIndicators.completed();
    } else if (index > currentStep) {
      return ProgressIndicators.inProgress(context);
    } else {
      return ProgressIndicators.next(context);
    }
  }
}
