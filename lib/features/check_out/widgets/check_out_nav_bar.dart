import 'package:flutter/cupertino.dart';

import '../../../../core/colors.dart';

class CheckOutNavbar extends StatelessWidget {
  const CheckOutNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 148/2,
      decoration:
          BoxDecoration(color: CupertinoTheme.of(context).barBackgroundColor),
      padding: const EdgeInsets.only(left: 16, right: 16,  top: 10),

      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/images/logo_shadow_black.png',
            width: 32,
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '400\$',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontWeight: FontWeight.w700, color: Colors.purple600),
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        //TODO shopping cart onTap
                      },
                      child: Image.asset('assets/images/shopping_cart.png',
                          width: 24, height: 24)),
                  const SizedBox(width: 16),
                  GestureDetector(
                      onTap: () {
                        //TODO notification onTap
                      },
                      child: Image.asset('assets/images/notification.png',
                          width: 24, height: 24)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
