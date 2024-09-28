import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/utils/auth_manager.dart';
import 'package:kidbank/core/utils/countries.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/dropdown.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/sign_up/data/survey_riverpod.dart';
import '../../../../core/colors.dart';
import '../../../../core/utils/requests.dart';
import '../../../../core/utils/token_manager.dart';
import '../../../../core/utils/validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isNameValid=false,isEmailValid = false, isCountryValid=false, isPasswordValid = false, doPasswordsMatch = false;
  final _nameController= TextEditingController();
  final _surnameController= TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onNext() {
    AuthManager.register(
        name:_nameController.text,
        surname: _surnameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
        onSuccess: ()=>context.go('/'),
        onError: (){
      showOkAlertDialog(context: context,title: 'Something went wrong',message: 'Error while registering');
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff3edff),
      child: SafeArea(
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height-MediaQuery.of(context).viewPadding.top,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Finish signing up',style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,textAlign: TextAlign.center,),
                  const Spacer(),
                  CustomTextField(
                    label: 'Name',
                    placeholder: 'Kataryna',
                    required: true,
                    validator: (value){
                      final result=Validators.validateText(value);
                      setState(() => isNameValid = result == null);
                      return result;
                    },
                  ),
                  const SizedBox(height: 16,),
                  CustomTextField(
                    label: 'Surname',
                    placeholder: 'Kowalska',
                    required: false,
                    controller: _surnameController,
                  ),
                  const SizedBox(height: 16,),
                  CustomTextField(
                    controller: _emailController,
                    label: 'Email',
                    placeholder: 'user.mail@gmail.com',
                    required: true,
                    validator: (value) {
                      final result = Validators.validateEmail(value);
                      setState(() => isEmailValid = result == null);
                      return result;
                    },
                  ),
                  const SizedBox(height: 16,),
                  Dropdown<String>(
                    label: 'Country',
                    placeholder: 'Choose country',
                    required: true,
                    itemBuilder: (BuildContext context, String value) {
                      return Text(value);
                    },
                    onSelected: (String value) {
                      setState(() {isCountryValid=true;});
                    },
                    suggestionsCallback: (String search) {
                      return countries
                          .where((e) => e.toLowerCase().contains(search.toLowerCase()))
                          .toList();
                    },
                  ),
                  const SizedBox(height: 16,),
                  CustomTextField(
                    label: 'Phone number',
                    placeholder: '+380 00 000 00 00',
                    required: false,
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    // TODO: Add phone validation logic
                  ),
                  const SizedBox(height: 16,),
                  CustomTextField.password(
                    controller: _passwordController,
                    label: 'Password',
                    placeholder: 'Enter password',
                    required: true,
                    validator: (value) {
                      final result = Validators.validatePassword(value);
                      setState(() => isPasswordValid = result == null);
                      return result;
                    },
                  ),
                  const SizedBox(height: 16,),
                  CustomTextField.password(
                    label: 'Confirm password',
                    placeholder: 'Enter password again',
                    required: true,
                    validator: (value) {
                      final result = Validators.validateConfirmPassword(
                          _passwordController.text, value);
                      setState(() => doPasswordsMatch = result == null);
                      return result;
                    },
                  ),
                  const SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 24),
                    child: Text(
                      'By registering, you are agreeing to our terms of service.',
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          fontSize: 15, color: Colors.grey500),
                    ),
                  ),
                  MainButton(
                    onTap: isNameValid&&isEmailValid &&isCountryValid&& isPasswordValid && doPasswordsMatch
                        ? _onNext
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

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
