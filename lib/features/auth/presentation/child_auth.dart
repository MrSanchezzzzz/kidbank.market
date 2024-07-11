import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/mascot_info.dart';

class ChildAuthScreen extends StatelessWidget {
  const ChildAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MainBackButton(label: 'Back',)
          ],
        ),
      ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Do you want to set up your  children’s accounts now?',style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
                  const SizedBox(height: 24,),
                  const MascotInfo(text: 'You can always do it in your account.',)
                  ,],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: MainButton(text: 'Skip',onTap: (){context.go('/add_child/finish');},color: const Color(0xFFFFF1E4),)),
                  const SizedBox(width: 16,),
                  Expanded(child: MainButton(text:'Let`s start',onTap: (){context.push('/auth_child/count');},))
                ],
              )
            ],
          ),
        )
    );
  }
}
