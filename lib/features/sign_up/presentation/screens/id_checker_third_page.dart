import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/features/sign_up/presentation/widgets/image_picker.dart';

import '../widgets/id_checker.dart';

class ThirdIdCheckerPage extends StatelessWidget {
  const ThirdIdCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IdCheker(
      currentStep: 2,
      title: 'ID checker',
      child:  const Padding(
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Upload a photo of your passport'),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Row(
                children: [
                  ImagePickerExample(),
                  SizedBox(width: 10),
                ],
              ),
            )
          ],
        ),
      ),
      onNext: () => context.push('/auth/id_check_success_page'),
    );
  }
}