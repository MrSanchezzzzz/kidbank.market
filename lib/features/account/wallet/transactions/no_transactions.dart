import 'package:flutter/cupertino.dart';

import '../../../../core/colors.dart';

class WalletNoTransactions extends StatelessWidget {
  const WalletNoTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20,),
        Image.asset('assets/images/search_zoom_out.png',width: 48,height: 48,),
        const SizedBox(height: 16,),
        Text('No transactions found',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          color: Colors.grey500
        ),)
      ],
    );
  }
}
