import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/link_button.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key});

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  bool codeValid = false;

  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void next() {
    context.push('/');
  }

  String? _validateCode(String? value) {
    if (value == null) {
      setState(() {
        codeValid = false;
      });
      return null;
    }

    // Define the regular expression for the code pattern
    final regExp = RegExp(r'^\d{2}-\d{2}-\d{2}$');

    if (regExp.hasMatch(value)) {
      setState(() {
        codeValid = true;
      });
      return null;
    }
    setState(() {
      codeValid = false;
    });
    return 'Enter valid code';
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
        middle: Text('Check you e-mail'),
      ),
      backgroundColor: const Color(0xfff3edff),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 50,
          ),
          child: Column(
            key: _formKey,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                  'To security log in, enter the verification code we sent to katatzyna123@gmail.com.'),
              const SizedBox(height: 20),
              CustomTextField.password(
                controller: _codeController,
                validator: _validateCode,
                required: true,
                label: 'Verification code',
                placeholder: '09-99-75',
              ),
              const LinkButton(
                text: 'Send again',
              ),
              MainButton(
                onTap: codeValid ? next : null,
                text: 'Confirm',
              ),
            ],
          )),
    );
  }
}
