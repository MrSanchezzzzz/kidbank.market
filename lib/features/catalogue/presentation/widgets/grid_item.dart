import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/main_square_button.dart';
import 'package:kidbank/core/widgets/toy_image.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/buy_button.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/toy_info.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ToyInfo(),
                  GestureDetector(
                    onTap: (){
                    },
                    child: const CatalogueBuyButton(),
                  ),
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
