import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/main_square_button.dart';
import 'package:kidbank/core/widgets/toy_image.dart';
import 'package:kidbank/core/widgets/toy/buy_button.dart';
import 'package:kidbank/core/widgets/toy/toy_info.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../colors.dart';

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
          Skeleton.replace(
              replacement: Bone.square(size: 171,borderRadius: BorderRadius.circular(16),),
              child: const ToyImage(),
          ),
          Skeleton.replace(
            replacement: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Bone.text(fontSize: 12,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Bone.text(fontSize: 12,),
                ),
              ],
            ),
            child: Text('Name',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontWeight: FontWeight.w700
            ),),
          ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ToyInfo(),
                  CatalogueBuyButton(),
                ],
              ),
          if(isMyToy)...{
            Padding(
              padding: const EdgeInsets.only(top: 4),
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
                      child: MainSquareButton(image: Image.asset('assets/images/add.png'),)
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
