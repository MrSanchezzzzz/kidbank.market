import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';

class CheckoutUnderlineText extends StatelessWidget {
  const CheckoutUnderlineText({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    bool _line = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey500,
                    ),
              ),
              Text(
                "$price\$",
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey300,
                    ),
              ),
            ],
          ),
        ),
        Container(
          width: 370,
          height: 0.4,
          color: Colors.purple300,
        )
      ],
    );
  }
}
