import 'package:flutter/cupertino.dart';

import '../../../../core/colors.dart';

class ToyInfo extends StatelessWidget {
  const ToyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('In new condition',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontSize: 13,
            color: Colors.green200
        ),),
        const SizedBox(height: 4,),
        Row(
          children: [
            Image.asset('assets/images/dracoin.png',width: 26,height: 26,),
            const SizedBox(width: 4,),
            Text('120',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                fontSize: 16,color: Colors.grey400
            ),)
          ],
        )
      ],
    );
  }
}
