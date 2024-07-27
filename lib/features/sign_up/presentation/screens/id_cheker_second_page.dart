import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';
import '../widgets/id_checker.dart';

class SecondIdCheckerPage extends StatefulWidget {
  const SecondIdCheckerPage({super.key});

  @override
  State<SecondIdCheckerPage> createState() => _SecondIdCheckerPageState();
}

class _SecondIdCheckerPageState extends State<SecondIdCheckerPage> {
  bool nameValid = false,
      sureNameValid = false,
      idNumberValid = false,
      expiresDateValid = false;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _sureNameController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _expiresDateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sureNameController.dispose();
    _idNumberController.dispose();
    _expiresDateController.dispose();
    super.dispose();
  }

  void next() {
    context.push('/auth/id_check_upload_photo_page');
  }

  String? validateName(String? value) {
    // Check if the value is null or empty
    if (value == null) {
      setState(() {
        nameValid = false;
      });
      return null;
    }

    // Check if the name contains only alphabetic characters and spaces
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(value)) {
      setState(() {
        nameValid = true;
      });
      return null;
    }

    // Check if the name is too short or too long
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    if (value.length > 10) {
      return 'Name must be less than 50 characters long';
    }

    return null; // Return null if the name is valid
  }

  String? validateSureName(String? value) {
    // Check if the value is null or empty
    if (value == null) {
       setState(() {
        sureNameValid = false;
      });
      return null;
    }

    // Check if the name contains only alphabetic characters and spaces
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(value)) {
       setState(() {
        sureNameValid = true;
      });
      return null;
    }

    // Check if the name is too short or too long
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    if (value.length > 50) {
      return 'Name must be less than 50 characters long';
    }

    return null; // Return null if the name is valid
  }

  String? validateIdNumber(String? value) {
    // Check if the value is null or empty
    if (value == null) {
       setState(() {
        idNumberValid = false;
      });
      return null;
    }

    // Check if the ID number contains only uppercase letters and digits
    final RegExp idRegExp = RegExp(r'^[A-Z0-9]+$');
    if (!idRegExp.hasMatch(value)) {
       setState(() {
        idNumberValid = true;
      });
      return null;
    }

    // Check if the ID number is of a specific length (e.g., at least 8 characters)
    if (value.length < 8) {
      return 'ID number must be at least 8 characters long';
    }

    return null; // Return null if the ID number is valid
  }

  
  @override
  Widget build(BuildContext context) {
    return IdCheker(
      currentStep: 1,
      title: 'ID checker',
     onNext: next,
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
              validator: validateName,
              label: 'Name',
              required: true,
              placeholder: 'Katarzuna',
            ),
            CustomTextField(
              validator: validateSureName,
              label: 'Surname',
              required: true,
              placeholder: 'Kowalska',
            ),
            CustomTextField(
              validator: validateIdNumber,
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
    );
  }
}
