import 'dart:async';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/utils/auth_manager.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/link_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/progress_indicator.dart';
import 'package:kidbank/features/sign_up/presentation/widgets/auth_integration_container.dart';
import 'package:kidbank/features/sign_up/presentation/widgets/or_line.dart';

import '../../../../core/utils/requests.dart';
import '../../../../core/utils/token_manager.dart';
import '../../../../core/utils/validators.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isEmailValid = false,
      isPasswordValid = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;

  void login() {
    FocusScope.of(context).unfocus();
    setState(() {
      loading = true;
    });
    String email = emailController.text;
    String password = passwordController.text;
    AuthManager.login(
        email: email,
        password: password,
        onSuccess: () => context.go('/'),
        onError: () {
          showOkAlertDialog(context: context,
              title: 'Something went wrong',
              message: 'It\'s looks like your email or password were invalid');
        }
    );
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery
                .of(context)
                .size
                .height - MediaQuery
                .of(context)
                .viewPadding
                .top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  style: CupertinoTheme
                      .of(context)
                      .textTheme
                      .navLargeTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                CustomTextField(
                    label: 'Email',
                    placeholder: 'user.mail@gmail.com',
                    required: true,
                    controller: emailController,
                    validator: (value) {
                      final result = Validators.validateEmail(value);
                      setState(() => isEmailValid = result == null);
                      return result;
                    },
                ),
                const SizedBox(height: 16,),
                CustomTextField.password(
                  label: 'Password',
                  placeholder: 'Enter password',
                  required: true,
                  controller: passwordController,
                  validator: (value) {
                    final result = Validators.validatePassword(value);
                    setState(() => isPasswordValid = result == null);
                    return result;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: LinkButton(text: 'Forgot password?', onPressed: () {
                    //TODO forgot password
                  },),
                ),
                SizedBox(
                  height: 44,
                  child: MainButton(
                    text: 'Log in',
                    onTap: isEmailValid && isPasswordValid ? login : null,
                    child: loading ? const AspectRatio(aspectRatio: 1, child: ProgressIndicator()) : null,
                  ),
                ),
                const SizedBox(height: 16),
                const OrLine(),
                const SizedBox(height: 16),
                AuthIntegrationContainer.google(),
                const SizedBox(height: 16),
                AuthIntegrationContainer.apple(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don’t have an account?'),
                    LinkButton(text: 'Sign up', onPressed: () {
                      context.push('/auth/sign_up');
                    },),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
