import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';

import '../widgets/id_checker.dart';

class SecondIdCheckerPage extends StatelessWidget {
  const SecondIdCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IdCheker(
      currentStep: 1,
      title: 'ID checker',
      child: const Padding(
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Enter data as in ID'),
              ],
            ),
            CustomTextField(
              label: 'Name',
              required: true,
              placeholder: 'Katarzuna',
            ),
            CustomTextField(
              label: 'Surname',
              required: true,
              placeholder: 'Kowalska',
            ),
            CustomTextField(
              label: 'ID number',
              required: true,
              placeholder: 'TU88029-131',
            ),
            CustomTextField(
              label: 'Expires',
              required: true,
              placeholder: '28/12/2024',
            ),
          ],
        ),
      ),
      onNext: () => context.push('/auth/id_check_upload_photo_page'),
    );
  }
}