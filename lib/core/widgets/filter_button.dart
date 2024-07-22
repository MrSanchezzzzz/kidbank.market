import 'package:flutter/cupertino.dart';

import '../colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key,required this.count,this.onTap});
  final Function()? onTap;
  final int count;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/filter.png',width: 24,height: 24,),
          const SizedBox(width: 5,),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sorting',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 16
                ),),
                Text('$count toys',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 13,
                    color: Colors.grey300
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
