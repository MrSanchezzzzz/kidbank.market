import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/colors.dart';

import '../widgets/id_checker.dart';

class SuccessIdCheckerPage extends StatelessWidget {
  const SuccessIdCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IdCheker(
      currentStep: 3,
      title: 'Rating',
      onNext: () => context.push('/auth/notification_page'),
      nextB: 'Continiue',
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/success.png',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Success',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'No one has yet rated a purchase from Lego Slava',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
