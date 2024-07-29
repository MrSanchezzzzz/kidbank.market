import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/photo_search_modal_sheet.dart';

import '../../../../core/colors.dart';
import '../../../../core/widgets/custom_modal_bottom_sheet.dart';

class CatalogueNavbar extends StatelessWidget {
  const CatalogueNavbar({super.key, this.onSearch});

  final Function(String)? onSearch;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CupertinoTheme.of(context).barBackgroundColor),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/logo_shadow_black.png',
                width: 32,
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TODO assert money string length <16
                  Text(
                    '400\$',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontWeight: FontWeight.w700, color: Colors.purple600),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            //TODO shopping cart onTap
                          },
                          child: Image.asset('assets/images/shopping_cart.png', width: 24, height: 24)),
                      const SizedBox(width: 16),
                      GestureDetector(
                          onTap: () {
                            //TODO notification onTap
                          },
                          child: Image.asset('assets/images/notification.png', width: 24, height: 24)),
                    ],
                  ),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
