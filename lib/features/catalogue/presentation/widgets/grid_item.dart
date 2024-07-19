import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/toy_image.dart';

import '../../../../core/colors.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key});
  //TODO final Toy
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //TODO view toy details
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const ToyImage(),
          Text('Name',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontWeight: FontWeight.w700
          ),),
          Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 13,color:Colors.grey400
            ),
          )
        ],
      ),
    );
  }
}
