import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import '../../../core/widgets/main_button.dart';

class OnboardingStartScreen extends StatelessWidget {
  const OnboardingStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to KidBank! Ready to start your toy adventure?',
                  style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/mascot.png',
                  height: 256,
                  fit: BoxFit.fitHeight,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: MainButton(
                  text: 'Skip',
                  onTap: () {
                    showOkCancelAlertDialog(
                            context: context,
                            title: 'Onboarding',
                            message: 'Are you sure you want to skip onboarding?',
                            cancelLabel: 'Cancel',
                            okLabel: 'Skip',
                            defaultType: OkCancelAlertDefaultType.cancel)
                        .then((value) {
                      if (value == OkCancelResult.ok) {
                        //TODO finish onboarding;
                        print('finish');
                      }
                    });
                  },
                  color: const Color(0xFFFFF1E4),
                )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: MainButton(
                  text: 'Let`s start',
                  onTap: () {
                    context.push('/onboarding/profile');
                  },
                ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
