import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../widgets/id_checker.dart';

class FirstIdCheckerPage extends StatelessWidget {
  const FirstIdCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IdCheker(
      currentStep: 0,
      title: 'ID checker',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          
          vertical: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select the type of the document you wish to scan'),
            const SizedBox(height: 10),
            const Text('Choose 1 option'),
            const SizedBox(height: 30),
            Row(
              children: [
                CupertinoRadio(
                  inactiveColor: const Color(0xff616161),
                  activeColor: const Color(0xff612fb1),
                  groupValue: false,
                  onChanged: (bool? value) {},
                  value: true,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Passport')
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                CupertinoRadio(
                  inactiveColor: const Color(0xff616161),
                  activeColor: const Color(0xff612fb1),
                  groupValue: false,
                  onChanged: (bool? value) {},
                  value: true,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Driver license')
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                CupertinoRadio(
                  inactiveColor: const Color(0xff616161),
                  activeColor: const Color(0xff612fb1),
                  groupValue: false,
                  onChanged: (bool? value) {},
                  value: false,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Identity card')
              ],
            ),
          ],
        ),
      ),
      onNext: () => context.push('/auth/id_check_enter_id_data_page'),
    );
  }
}
