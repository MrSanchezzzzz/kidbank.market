import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/auth/models/auth_state.dart';

import '../../../../core/utils/auth_manager.dart';
import '../../../../core/utils/validators.dart';
import '../../providers/error_text_provider.dart';

class AuthController extends StateNotifier<AuthState>{
  AuthController() : super(const AuthState());


  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


  void login(BuildContext context,WidgetRef ref) {
    AuthState authState=state;
    if(!authState.isAllValid){
      return;
    }
    state=state.copyWith(loading: true);
    String email = emailController.text;
    String password = passwordController.text;
    AuthManager.login(
        email: email,
        password: password,
        onSuccess: () => context.go('/'),
        onError: (code) {
          if(code==463){
            ref.read(authErrorTextProvider.notifier).state='Invalid username or password.';
          }
          else {
            ref.read(authErrorTextProvider.notifier).state='Something gone wrong';
          }
        }
    );
    state=state.copyWith(loading: true);
  }



  String? validateEmail(String? value){
    final result = Validators.validateEmail(value);
    state=state.copyWith(isEmailValid:result==null);
    return result;
  }

  String? validatePassword(String? value){
    final result = Validators.validatePassword(value);
    state=state.copyWith(isPasswordValid:result==null);
    return result;
  }
}