import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/utils/auth_manager.dart';
import 'package:kidbank/core/utils/validators.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/notification.dart';
import 'package:kidbank/features/sign_up/providers/error_text_provider.dart';

import '../../models/sign_up_state.dart';

// SignUpController as a StateNotifier
class SignUpController extends StateNotifier<SignUpState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpController() : super(const SignUpState());
  // Validating Name
  String? validateName(String? value) {
    final result = Validators.validateText(value);
    state = state.copyWith(isNameValid: result == null);
    return result;
  }

  // Validating Email
  String? validateEmail(String? value) {
    final result = Validators.validateEmail(value);
    state = state.copyWith(isEmailValid: result == null);
    return result;
  }

  // Validating Password
  String? validatePassword(String? value) {
    final result = Validators.validatePassword(value);
    state = state.copyWith(isPasswordValid: result == null);
    return result;
  }

  // Validating Confirm Password
  String? validateConfirmPassword(String value) {
    final result = Validators.validateConfirmPassword(passwordController.text, value);
    state = state.copyWith(doPasswordsMatch: result == null);
    return result;
  }

  void onCountrySelected() {
    state = state.copyWith(isCountryValid: true);
  }

  // Registration process
  void onNext(BuildContext context,WidgetRef ref) {
    AuthManager.register(
      name: nameController.text,
      surname: surnameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      onSuccess: () => context.go('/'),
      onError: (code) {
        switch(code){
          case 461:
            CustomNotification.show(context,
              title: 'Email address already registered',
              text:'The email address entered is already associated with an existing account',
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MainButton(text: 'Reset password',onTap: (){},),
                  MainButton(text: 'Login with email',onTap: (){
                    context.go('/');
                  },),
                ],
              )
            );
            break;
            //TODO handle codes
            default:
              showOkAlertDialog(context: context, title: 'Something went wrong', message: 'Error while registering');
              break;
        }

      },
    );
  }
}
