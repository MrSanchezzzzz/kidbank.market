import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/main_square_button.dart';
import 'package:kidbank/core/widgets/toy_image.dart';
import 'package:kidbank/core/widgets/toy/buy_button.dart';
import 'package:kidbank/core/widgets/toy/toy_info.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../colors.dart';

class CatalogueListItem extends StatelessWidget {
  const CatalogueListItem({super.key,this.isMyToy=false});
  final bool isMyToy;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push('/toy_details');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Skeleton.replace(
              replacement: Bone.square(size: 80,borderRadius: BorderRadius.circular(14),),
                child: const ToyImage(size: 80)
            ),
            const SizedBox(width: 16),  // Add some spacing between the image and the text
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Skeleton.replace(
                            replacement:Bone.text(words: 2,fontSize: 16,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Teddy bear',
                                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4,),
                          const ToyInfo()
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Skeleton.ignore(
                            child: Image.asset('assets/images/hearth.png',width: 24,height: 24,)
                        ),
                        const SizedBox(width: 8,),
                        const CatalogueBuyButton()
                      ],
                    )
                  ],
                ),
              ),
            ),
            if(isMyToy)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 32,child: MainSquareButton(image: Image.asset('assets/images/add.png'),),),
                    const SizedBox(width: 4,),
                    Image.asset('assets/images/hearth.png',width: 16,height: 16,)
                  ],
                ),
                Text('\$120',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: Colors.grey400,
                  fontSize: 16
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
