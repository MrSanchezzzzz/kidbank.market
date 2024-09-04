import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/features/account/settings/widgets/actions.dart';
import 'package:kidbank/features/account/settings/widgets/chat.dart';
import 'package:kidbank/features/account/settings/widgets/privacy_policy.dart';
import 'package:kidbank/features/account/settings/widgets/notification.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        leading: const MainBackButton(
          label: 'Back',
        ),
        middle:const Text('Settings'),
        border: const Border(bottom: BorderSide.none),
      ),
      child: Column(
          children: [
            PrivacyPolicy(),
            NotificationSetting(),
            Chat(),
            ActionsSettings()
          ],
      ),
    );
  }
}
