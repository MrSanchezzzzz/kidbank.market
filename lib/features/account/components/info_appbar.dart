import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';


class InfoAppbar extends StatelessWidget {
  const InfoAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: const MainBackButton(label: 'Back'),
      middle: Text(
        'Profile',
        style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
          color: CupertinoColors.black,
        ),
      ),
      backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
      border: const Border(bottom: BorderSide.none),
    );
  }
}