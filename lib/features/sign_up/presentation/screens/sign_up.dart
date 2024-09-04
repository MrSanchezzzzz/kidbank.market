import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/utils/countries.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/dropdown.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import '../../../../core/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool emailValid = false, passwordValid = false, passwordConfirm = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      const Text('Passwords match!');
    }
  }

  bool _passwordsMatch() {
    return _passwordController.text == _confirmPasswordController.text;
  }

  void next() {
    context.push('/auth/improve');
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

  String? validateConfirmPassword(String? value) {
    if (value == null) {
      setState(() {
        passwordValid = false;
      });
      return null;
    }

    if (!_passwordsMatch()) {
      setState(() {
        passwordConfirm = false;
      });
      return 'Password  do not mach';
    }
    setState(() {
      passwordConfirm = true;
    });
    return null;
  }

  CupertinoNavigationBar navBar= const CupertinoNavigationBar(
    leading: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MainBackButton(label: 'Back'),
      ],
    ),
    border: Border(bottom: BorderSide.none),
    backgroundColor: Color(0xfff3edff),
    middle: Text('Finish sing up'),
  );
  
  @override
  Widget build(BuildContext context) {
    final double pageSize = MediaQuery.of(context).size.height;
    final double notifySize = MediaQuery.of(context).padding.top;
    final double appBarSize = navBar.preferredSize.height;
    return CupertinoPageScaffold(
      navigationBar: navBar,
      backgroundColor: const Color(0xfff3edff),
      child: SingleChildScrollView(
        child: Container(
          height: pageSize - (appBarSize + notifySize),
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
          child: Column(
            key: _formKey,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///Name Field
              const CustomTextField(
                label: 'Name',
                placeholder: 'Kataryna',
                required: true,
              ),

              ///Surname Field
              const CustomTextField(
                label: 'Surname',
                placeholder: 'Kowalska',
                required: false,
              ),
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                placeholder: 'user.mail@gmail.com',
                required: true,
                validator: validateEmail,
              ),
              //TODO replace String to Country
              Dropdown(
                  label: 'Country',
                  placeholder: 'Choose country',
                  required: true,
                  itemBuilder: (BuildContext context, String value) {
                    return Text(value);
                  },
                  onSelected: (String value) {  },
                  suggestionsCallback: (String search) {
                    return countries.where((e)=>e.toLowerCase().contains(search.toLowerCase())).toList();
                  }
              ),
              const CustomTextField(
                label: 'Phone number',
                placeholder: '+380 00 000 00 00',
                required: false,
                //TODO phone validation
                keyboardType: TextInputType.phone,
              ),

              CustomTextField.password(
                controller: _passwordController,
                label: 'Password',
                placeholder: 'Enter password',
                required: true,
                validator: validatePassword,
              ),

              CustomTextField.password(
                controller: _confirmPasswordController,
                label: 'Confirm password',
                placeholder: 'Enter password again',
                required: true,
                validator: validateConfirmPassword,
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 24,
                ),
                child: Text(
                  'By registering, you are agreeing to our terms of service.',
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 15,
                    color: Colors.grey500
                  ),
                ),
              ),
              MainButton(
                onTap: emailValid && passwordValid && passwordConfirm
                    ? next
                    : null,
                text: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}