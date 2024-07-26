import 'package:flutter/cupertino.dart';

import '../../../../core/colors.dart';

class DiagramLegendItem extends StatelessWidget {
  const DiagramLegendItem({super.key,required this.color,required this.label});
  final Color color;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:color,
              border: Border.all(color: Colors.white100,width: 2)
          ),
          width: 20,height: 20,
        ),
        const SizedBox(width: 8,),
        Text(label,style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 15
        ),)
      ],
    );
  }
}
