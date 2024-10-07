import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/auth/providers/button_active_provider.dart';
import 'package:kidbank/features/auth/providers/loading_riverpod.dart';

import '../../../../core/utils/auth_manager.dart';
import '../../../../core/utils/validators.dart';
import '../../providers/error_text_provider.dart';

class AuthController{
  AuthController(this.context,this.ref);

  final BuildContext context;
  final WidgetRef ref;
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  bool loading=false;
  bool isEmailValid=false,isPasswordValid=false;
  void login() {
    FocusScope.of(context).unfocus();
    if(!isEmailValid||!isPasswordValid){
      return;
    }


    ref.read(loadingProvider.notifier).state=true;
    String email = emailController.text;
    String password = passwordController.text;
    AuthManager.login(
        email: email,
        password: password,
        onSuccess: () => context.go('/'),
        onError: (code) {
          print(code);
          if(code==463){
            ref.read(authErrorTextProvider.notifier).state='Invalid username or password.';
          }
          else {
            ref.read(authErrorTextProvider.notifier).state='Something gone wrong';
          }
        }
    );
    ref.read(loadingProvider.notifier).state=false;

  }



  String? validateEmail(String? value){
    final result = Validators.validateEmail(value);
    isEmailValid=result==null;
    ref.watch(authButtonActiveProvider.notifier).state=isEmailValid&&isPasswordValid;
    return result;
  }

  String? validatePassword(String? value){
    final result = Validators.validatePassword(value);
    isPasswordValid=result==null;
    ref.watch(authButtonActiveProvider.notifier).state=isEmailValid&&isPasswordValid;
    return result;
  }
}