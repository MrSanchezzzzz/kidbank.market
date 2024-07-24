import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/colors.dart';
import '../../../core/widgets/image_container.dart';
import 'widgets/onboarding_scaffold.dart';

class OnboardingCurrencyScreen extends StatelessWidget {
  const OnboardingCurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Virtual Currency',
      currentStep: 3,
      onBack: () {
        context.pop();
      },
      onNext: () {
        //TODO finish onboarding
      },
      finish: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16,),
          Text('Earn virtual currency by selling toys and spend it to buy new ones! The purchases can’t be done without parents’ approval.', style: CupertinoTheme
              .of(context)
              .textTheme
              .textStyle
              .copyWith(fontSize: 16, color: Colors.grey400),),
          const SizedBox(height: 8,),
          const ImageContainer(height: 360,),
        ],
      ),
    );
  }
}