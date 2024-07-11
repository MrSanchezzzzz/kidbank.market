import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/colors.dart';
import '../../../core/widgets/image_container.dart';
import 'onboarding_scaffold.dart';

class OnboardingExploreScreen extends StatelessWidget {
  const OnboardingExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Explore and Wishlist',
      currentStep: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16,),
          Text('Explore toys from other kids and add your favorites to your wishlist', style: CupertinoTheme
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
        context.push('/onboarding/currency');
      },
    );
  }
}