import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/account/wallet/balance/balance.dart';
import 'package:kidbank/features/account/wallet/presentation/widgets/payment_methods.dart';
import 'package:kidbank/features/account/wallet/transactions/transactions.dart';

import '../../../../../core/colors.dart';

class AccountWalletScreen extends StatelessWidget {
  const AccountWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          leading: MainBackButton(
            label: 'Back',
          ),
          middle: Text('My wallet'),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    WalletBalance(),
                    SizedBox(height: 24,),
                    WalletPaymentMethods(),
                    SizedBox(height: 24,),
                    WalletTransactions(),
                    SizedBox(height: 72,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: MainButton(
                  text: 'Top up',
                  icon: Image.asset('assets/images/money_add.png',width: 24,height: 24,color: Colors.orange500,),
                  onTap: (){
                    Navigator.of(context).pushNamed('/account/wallet/top_up');
                  },
                  pressedOpacity: 0.95,
                ),
              )
            ],
          ),
        ));
  }
}
