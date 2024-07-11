import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/image_container.dart';
import 'package:kidbank/features/onboarding/presentation/onboarding_scaffold.dart';

import '../../../core/colors.dart';

class OnboardingProfileScreen extends StatelessWidget {
  const OnboardingProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
        title: 'Create your profile',
        currentStep: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16,),
            Text('Set up your profile to manage your child\'s account securely as a parent.',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16,color: Colors.grey400),),
            const SizedBox(height: 8,),
            const ImageContainer(height: 180,),
            const SizedBox(height: 16,),
            Text('Set up your profile as a child. Add your name and choose a fun avatar',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16,color: Colors.grey400),),
            const SizedBox(height: 8,),
            const ImageContainer(height: 180,)
          ],
        ),
      onBack: (){context.pop();},
      onNext: (){context.push('/onboarding/toy');},
    );
  }
}
