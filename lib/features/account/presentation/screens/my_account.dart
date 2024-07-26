import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/account/components/account_appbar.dart';
import 'package:kidbank/features/account/components/account_main.dart';
import 'package:kidbank/features/account/components/details.dart';
import 'package:kidbank/features/account/components/statistics.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AccountAppbar(),
              const AccountMain(),
              const Statistics(),
              Details()
            ],
          ),
        ),
    );
  }
}
