import 'package:flutter/cupertino.dart';

import '../colors.dart';

class BalanceIndicator extends StatelessWidget {
  const BalanceIndicator({super.key,this.balance=400});
  final int balance;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          balance>1000000?'1M+':balance.toString(),
          style: CupertinoTheme.of(context)
              .textTheme
              .textStyle
              .copyWith(fontWeight: FontWeight.w700, color: Colors.purple600),
        ),
        const SizedBox(width: 4,),
        Image.asset('assets/images/dracoin.png',width: 16,height: 16,)
      ],
    );
  }
}
