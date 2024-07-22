import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/account/wallet/transactions/transactions_list_tile.dart';

import '../../../../core/colors.dart';

class WalletTransactions extends StatelessWidget {
  const WalletTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TRANSACTIONS',
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 13, color: Colors.grey300),
        ),
        const SizedBox(
          height: 8,
        ),
        CupertinoListSection.insetGrouped(
          hasLeading: false,
          margin: EdgeInsets.zero,
          children: const [
            TransactionsListTile(title: 'The "Bear" toy sale', date: 'Tuesday', money: 10.99),
            TransactionsListTile(title: 'The "Bear" toy sale', date: 'Tuesday', money: 10.99,isIncome: false,),
            TransactionsListTile(title: 'The "Bear" toy sale', date: 'Tuesday', money: 10.99),
            TransactionsListTile(title: 'The "Bear" toy sale', date: 'Tuesday', money: 10.99,isIncome: false,),
          ],
        )
      ],
    );
  }
}
