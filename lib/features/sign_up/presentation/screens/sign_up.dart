import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidbank/features/auth/presentation/widgets/error_message.dart';
import 'package:kidbank/features/sign_up/providers/error_text_provider.dart';
import '../../../../core/colors.dart';
import '../../../../core/utils/countries.dart';
import '../../providers/sign_up_controller_provider.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/dropdown.dart';
import 'package:kidbank/core/widgets/main_button.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpControllerProvider);
    final signUpController = ref.read(signUpControllerProvider.notifier);

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff3edff),
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Finish signing up',
                    style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  CustomTextField(
                    controller: signUpController.nameController,
                    label: 'Name',
                    placeholder: 'Kataryna',
                    required: true,
                    validator: (value) => signUpController.validateName(value),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: signUpController.surnameController,
                    label: 'Surname',
                    placeholder: 'Kowalska',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: signUpController.emailController,
                    label: 'Email',
                    placeholder: 'user.mail@gmail.com',
                    required: true,
                    validator: (value) => signUpController.validateEmail(value),
                  ),
                  const SizedBox(height: 16),
                  Dropdown<String>(
                    label: 'Country',
                    placeholder: 'Choose country',
                    required: true,
                    itemBuilder: (BuildContext context, String value) {
                      return Text(value);
                    },
                    onSelected: (String value) {
                      signUpController.onCountrySelected();
                    },
                    suggestionsCallback: (String search) {
                      return countries.where((e) => e.toLowerCase().contains(search.toLowerCase())).toList();
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: signUpController.phoneController,
                    label: 'Phone number',
                    placeholder: '+380 00 000 00 00',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField.password(
                    controller: signUpController.passwordController,
                    label: 'Password',
                    placeholder: 'Enter password',
                    required: true,
                    validator: (value) => signUpController.validatePassword(value),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField.password(
                    label: 'Confirm password',
                    placeholder: 'Enter password again',
                    required: true,
                    validator: (value) => signUpController.validateConfirmPassword(value!),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 24),
                    child: Text(
                      'By registering, you are agreeing to our terms of service.',
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          fontSize: 15, color: Colors.grey500),
                    ),
                  ),
                  AuthErrorMessage(errorTextProvider: signUpErrorTextProvider,),
                  MainButton(
                    onTap: signUpState.isNameValid &&
                        signUpState.isEmailValid &&
                        signUpState.isCountryValid &&
                        signUpState.isPasswordValid &&
                        signUpState.doPasswordsMatch
                        ? () => signUpController.onNext(context,ref)
                        : null,
                    text: 'Continue',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
