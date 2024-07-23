import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainBackButton(label: 'Label'),
          ],
        ),
        border: Border(bottom: BorderSide.none),
        backgroundColor: Color(0xfff3edff),
      ),
      backgroundColor: const Color(0xfff3edff),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Turn on notifications'),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xffd9d9d9),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Don't miss important messages like orders’ management or your child's activity.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 460.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainButton(
                    color: Colors.orange100,
                    text: 'Skip',
                    onTap: () {
                      ///Skep
                    },
                  ),
                  MainButton(
                    onTap: () {},
                    text: 'Turn on',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}