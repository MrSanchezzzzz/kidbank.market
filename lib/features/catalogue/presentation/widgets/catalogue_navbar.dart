import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/balance_indicator.dart';

class CatalogueNavbar extends StatelessWidget {
  const CatalogueNavbar({super.key, this.onSearch});

  final Function(String)? onSearch;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CupertinoTheme.of(context).barBackgroundColor),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 10),
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
                  const BalanceIndicator(),
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
