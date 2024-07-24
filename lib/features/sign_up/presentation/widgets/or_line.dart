import 'package:flutter/cupertino.dart';

import '../../../../core/colors.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.purple300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('OR',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: Colors.purple500,fontSize: 13),),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.purple300,
          ),
        ),
      ],
    );
  }
}
