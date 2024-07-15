import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/ui_card.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  //TODO save selected role;
  String role = 'adult';
  bool isAdult = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/logo_shadow.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Text(
                    'Who is using the app?',
                    style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiCard(
                        image: Image.asset(
                          'assets/images/mascot_adult.png',
                          width: 44,
                          height: 44,
                        ),
                        checked: isAdult,
                        onChanged: () {
                          role = 'adult';
                          setState(() {
                            isAdult = true;
                          });
                        },
                        label: 'Parent',
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      UiCard(
                        image: Image.asset(
                          'assets/images/mascot_kid.png',
                          width: 44,
                          height: 44,
                        ),
                        checked: !isAdult,
                        onChanged: () {
                          role = 'kid';
                          setState(() {
                            isAdult = false;
                          });
                        },
                        label: 'Child',
                      ),
                    ],
                  )
                ],
              ),
              MainButton(
                text: 'Next',
                onTap: () {
                  if(role=='adult'){
                    context.push('/auth');
                  }
                  //TODO when registration role selected
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
