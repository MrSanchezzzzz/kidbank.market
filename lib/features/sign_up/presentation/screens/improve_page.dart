import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/sign_up/presentation/widgets/survey_options.dart';

class ImprovePage extends StatefulWidget {
  const ImprovePage({super.key});

  @override
  State<ImprovePage> createState() => _ImprovePageState();
}

class _ImprovePageState extends State<ImprovePage> {
  bool emailValid = false, passwordValid = false;

  void next() {
    //TODO post options to server
    context.push('/auth/id_check_select_document_page');
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
        middle: Text('Help us improve!'),
      ),
      backgroundColor: const Color(0xfff3edff),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('What features of the app are most interesting to you?',style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
            const SizedBox(height: 8,),
            const Text('Choose 1 or 2 options'),
            const SizedBox(height: 16,),
            const SurveyOptions(),
            const Spacer(),
            MainButton(
              color: const Color(0xfff3edff),
              text: 'Skip',
              onTap: () {
                context.go('/');
              },
            ),
            const SizedBox(height: 16,),
            MainButton(
              onTap: () {
                next();
              },
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}