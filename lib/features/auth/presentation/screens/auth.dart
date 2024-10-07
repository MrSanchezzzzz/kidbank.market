import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/link_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/notification.dart';
import 'package:kidbank/core/widgets/progress_indicator.dart';
import 'package:kidbank/features/auth/presentation/screens/auth_controller.dart';
import 'package:kidbank/features/auth/presentation/widgets/error_message.dart';
import 'package:kidbank/features/auth/providers/button_active_provider.dart';
import 'package:kidbank/features/auth/providers/error_text_provider.dart';
import 'package:kidbank/features/auth/providers/loading_riverpod.dart';
import 'package:kidbank/features/sign_up/presentation/widgets/auth_integration_container.dart';
import 'package:kidbank/features/sign_up/presentation/widgets/or_line.dart';
import 'package:overlay_support/overlay_support.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  @override
  ConsumerState<AuthScreen> createState() => AuthScreenState();
}

class AuthScreenState extends ConsumerState<AuthScreen> {
  late final AuthController authController;
  final GlobalKey globalKey=GlobalKey();
  @override
  void initState() {
    authController=AuthController(context,ref);
    super.initState();
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
                    controller: authController.emailController,
                    validator: authController.validateEmail,
                ),
                const SizedBox(height: 16,),
                CustomTextField.password(
                  label: 'Password',
                  placeholder: 'Enter password',
                  required: true,
                  controller: authController.passwordController,
                  validator: authController.validatePassword
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: LinkButton(text: 'Forgot password?', onPressed: () {
                    //TODO forgot password
                  },),
                ),
                AuthErrorMessage(errorTextProvider: authErrorTextProvider,errorShowTimerProvider: authErrorShowTimerProvider,),
                SizedBox(
                  height: 44,
                  child: Consumer(
                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      bool loading=ref.watch(loadingProvider);
                      bool isActive=ref.watch(authButtonActiveProvider);
                      return MainButton(
                        text: 'Log in',
                        onTap: isActive?authController.login:null,
                        child: loading ? const AspectRatio(aspectRatio: 1, child: ProgressIndicator()) : null,
                      );
                    },
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
