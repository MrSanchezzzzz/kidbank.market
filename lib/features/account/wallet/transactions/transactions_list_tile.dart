import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/account/wallet/transactions/transaction_details.dart';

import '../../../../core/colors.dart';

class TransactionsListTile extends StatelessWidget {
  const TransactionsListTile(
      {super.key, required this.title, required this.date, required this.money, this.isIncome = true});

  final String title;
  final String date;
  final double money;
  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    Image icon = Image.asset(
      isIncome ? 'assets/images/empty_wallet_add.png' : 'assets/images/empty_wallet_remove.png',
      width: 24,
      height: 24,
    );
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>const TransactionDetailsScreen(/*TODO transaction:transaction*/)));
      },
      child: CupertinoListTile(
        title: Row(
          children: [
            icon,
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(
                  date,
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 13),
                )
              ],
            )
          ],
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '\$$money',
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(color: isIncome ? Colors.green200 : Colors.red200),
            ),
            const SizedBox(width: 8,),
            //TODO custom chevron
            const CupertinoListTileChevron()
          ],
        ),
      ),
    );
  }
}
