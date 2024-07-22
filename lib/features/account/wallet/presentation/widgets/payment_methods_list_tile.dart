import 'package:flutter/cupertino.dart';

import '../../../../../core/colors.dart';

class PaymentMethodsListTile extends StatelessWidget {
  const PaymentMethodsListTile({super.key,this.cardImage,required this.title,required this.cardNumber});
  final ImageProvider? cardImage;
  final String title;
  final String cardNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,//TODO open method details...
      child: CupertinoListTile(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image:cardImage!=null? DecorationImage(
                        image: cardImage!,
                        fit: BoxFit.fill
                    ):null,
                    color: Colors.grey100
                ),
              ),
              const SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(cardNumber,style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 13
                  ),)
                ],
              ),
            ],
          ),
        //TODO custom chevron
        trailing: const CupertinoListTileChevron(),
      ),
    );
  }
}
