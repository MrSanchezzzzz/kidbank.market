import 'package:flutter/cupertino.dart';

import '../../../../core/colors.dart';
import 'balance_diagram.dart';
import 'diagram_legend.dart';

class WalletBalance extends StatelessWidget {
  const WalletBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        '\$400',
        style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(fontSize: 34),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        'Balance',
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: Colors.grey300, fontSize: 15),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 16,),
      SizedBox(
        height: MediaQuery.of(context).size.width*0.625,
        child: const AspectRatio(
          aspectRatio: 1,
            child: BalanceDiagram(income: 50,outcome: 150,)
        ),
      ),
      const SizedBox(height: 8,),
      const DiagramLegend()
    ],);
  }
}
