import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/link_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/registration/presentation/widgets/auth_integration_container.dart';
import 'package:kidbank/features/registration/presentation/widgets/or_line.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool emailValid = false, passwordValid = false;
  bool showPassword=false;
  void login() {}

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
    return 'Enter valid password';
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 16),
                Image.asset(
                  'assets/images/logo_shadow.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(height: 24),
                Text(
                  'Log in or sign up',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navLargeTitleTextStyle
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: 'Email',
                    validator: validateEmail,
                    placeholder: 'user.mail@gmail.com',
                    required: true,
                  ),
                  CustomTextField.password(
                    label: 'Password',
                    validator: validatePassword,
                    placeholder: 'Enter password',
                    required: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: LinkButton(text: 'Forgot password?',onPressed: (){
                      //TODO forgot password
                    },),
                  ),
                  MainButton(
                    text: 'Log in',
                    onTap: emailValid && passwordValid ? login : null,
                  ),
                  const SizedBox(height: 16),
                  const OrLine(),
                  const SizedBox(height: 16),
                  AuthIntegrationContainer.apple(),
                  const SizedBox(height: 16),
                  AuthIntegrationContainer.google(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don’t have an account?'),
                      LinkButton(text: 'Sign up',onPressed: (){
                        //TODO go to sign up
                      },),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
