import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import '../widgets/id_checker.dart';

class SecondIdCheckerPage extends StatefulWidget {
  const SecondIdCheckerPage({super.key});

  @override
  State<SecondIdCheckerPage> createState() => _SecondIdCheckerPageState();
}

class _SecondIdCheckerPageState extends State<SecondIdCheckerPage> {
  final _nameController = TextEditingController();
  final _sureNameController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _expiresDateController = TextEditingController();

  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkInput);
    _sureNameController.addListener(_checkInput);
    _idNumberController.addListener(_checkInput);
    _expiresDateController.addListener(_checkInput);
  }

  void _checkInput() {
    setState(() {
      _isButtonVisible = _nameController.text.trim().isNotEmpty &&
          _sureNameController.text.trim().isNotEmpty &&
          _idNumberController.text.trim().isNotEmpty &&
          _expiresDateController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.removeListener(_checkInput);
    _nameController.dispose();
    _sureNameController.removeListener(_checkInput);
    _sureNameController.dispose();
    _idNumberController.removeListener(_checkInput);
    _idNumberController.dispose();
    _expiresDateController.removeListener(_checkInput);
    _expiresDateController.dispose();
    super.dispose();
  }

  void next() {
    context.push('/auth/id_check_upload_photo_page');
  }

  @override
  Widget build(BuildContext context) {
    return IdCheker(
      currentStep: 1,
      title: 'ID checker',
      onNext: _isButtonVisible ? next : null,
      nextB: 'Next',
      skip: 'Skip',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Text('Enter data as in ID'),
              ],
            ),
            CustomTextField(
              controller: _nameController,
              label: 'Name',
              required: true,
              placeholder: 'Katarzuna',
            ),
            CustomTextField(
              controller: _sureNameController,
              label: 'Surname',
              required: true,
              placeholder: 'Kowalska',
            ),
            CustomTextField(
              controller: _idNumberController,
              label: 'ID number',
              required: true,
              placeholder: 'TU88029-131',
            ),
            CustomTextField(
              controller: _expiresDateController,
              label: 'Expires',
              required: true,
              placeholder: '28/12/2024',
            ),
          ],
        ),
      ),
    );
  }
}
