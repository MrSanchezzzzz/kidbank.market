import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/add_button.dart';
import 'package:kidbank/core/widgets/toy_image.dart';
import 'package:kidbank/features/catalogue/toy_details/toy_details.dart';

import '../../../../core/colors.dart';

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
        height: 78,
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ToyImage(size: 78),
            const SizedBox(width: 16),  // Add some spacing between the image and the text
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Teddy bear',
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    const Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                    const SizedBox(width: 32,child: MainAddButton(),),
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
