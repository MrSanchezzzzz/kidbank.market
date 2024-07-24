import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/widgets/custom_radio_button.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';

class ImprovePage extends StatefulWidget {
  const ImprovePage({super.key});

  @override
  State<ImprovePage> createState() => _SignUpState();
}

class _SignUpState extends State<ImprovePage> {
  bool emailValid = false, passwordValid = false;
  final inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void next() {
    context.push('/auth/id_check_select_document_page');
  }

  String? validateEmail(String? value) {
    if (value == null) {
      setState(() {
        emailValid = false;
      });
      return null;
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(value)) {
      setState(() {
        emailValid = true;
      });
      return null;
    }
    setState(() {
      emailValid = false;
    });
    return 'Enter valid email';
  }

  String? validatePassword(String? value) {
    if (value == null) {
      setState(() {
        passwordValid = false;
      });
      return null;
    }
    String pattern = r'^.{8,}$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(value)) {
      setState(() {
        passwordValid = true;
      });
      return null;
    }
    setState(() {
      passwordValid = false;
    });
    return 'The password must contain at least 8 characters.';
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: const CupertinoNavigationBar(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainBackButton(label: 'Back'),
          ],
        ),
        border: Border(bottom: BorderSide.none),
        backgroundColor: Color(0xfff3edff),
        middle: Text('Help us improve!'),
      ),
      backgroundColor: const Color(0xfff3edff),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('What features of the app are most interesting to you?'),
            const Text('Choose 1 or 2 options'),
            const Row(
              children: [
                CustomRadioButton(
                  enabled: false,
                  value: null,
                  groupValue: null,
                ),
                Text("Sell child's toys")
              ],
            ),
            const Row(
              children: [
                CustomRadioButton(
                  enabled: false,
                  value: null,
                  groupValue: null,
                ),
                Text("Buy toys for the child"),
              ],
            ),
            const Row(
              children: [
                CustomRadioButton(
                  enabled: false,
                  value: null,
                  groupValue: null,
                ),
                Text("Supervise the sale of toys by the child"),
              ],
            ),
            const Row(
              children: [
                CustomRadioButton(
                  enabled: false,
                  value: null,
                  groupValue: null,
                ),
                Text("Supervise the child's purchase of toys"),
              ],
            ),
            const Row(
              children: [
                CustomRadioButton(
                  value: null,
                  groupValue: null,
                ),
                Text("Teaching children financial literacy"),
              ],
            ),
            const Row(
              children: [
                CustomRadioButton(
                  enabled: false,
                  value: null,
                  groupValue: null,
                ),
                Text("Other"),
              ],
            ),
            CustomTextField(
              controller: inputController,
              label: '',
              placeholder: 'Place for other ideas',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainButton(
                  color: Colors.orange100,
                  text: 'Skip',
                  onTap: () {
                    ///Skip
                  },
                ),
                MainButton(
                  onTap: () {
                    next();
                  },
                  text: 'Next',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}