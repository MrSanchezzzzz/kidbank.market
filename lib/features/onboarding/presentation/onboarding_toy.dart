import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/colors.dart';
import '../../../core/widgets/image_container.dart';
import 'widgets/onboarding_scaffold.dart';

class OnboardingToyScreen extends StatelessWidget {
  const OnboardingToyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Add your first toy',
      currentStep: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8,),
          Text('Add a toy you want to sell or exchange. Take a picture and write a description.', style: CupertinoTheme
              .of(context)
              .textTheme
              .textStyle
              .copyWith(fontSize: 16, color: Colors.grey400),),
          const SizedBox(height: 8,),
          const ImageContainer(height: 360,),
        ],
      ),
      onBack: () {
        context.pop();
      },
      onNext: () {
        context.push('/onboarding/explore');
      },
    );
  }
}