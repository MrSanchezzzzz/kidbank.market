import 'package:flutter/cupertino.dart';

import '../colors.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key,required this.sortBy,this.onTap});
  final Function()? onTap;
  final String sortBy;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/sort.png',width: 24,height: 24,),
          const SizedBox(width: 5,),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sorting',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 16
                ),),
                Text('by $sortBy',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
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
