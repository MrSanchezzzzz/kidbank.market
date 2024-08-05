import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/add_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/toy_image.dart';

import '../../../../core/colors.dart';

class CatalogueGridItem extends StatelessWidget {
  const CatalogueGridItem({super.key,this.isMyToy=false});
  final bool isMyToy;
  //TODO final Toy
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push('/toy_details');
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
          ),
          if(isMyToy)...{
            Padding(
              padding: EdgeInsets.only(top: 4),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('400\$',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 16,
                      color: Colors.grey300
                  ),),
                  SizedBox(
                      width: 44,
                      child: MainAddButton()
                  )
                ],
              ),
            )

          }
        ],
      ),
    );
  }
}
