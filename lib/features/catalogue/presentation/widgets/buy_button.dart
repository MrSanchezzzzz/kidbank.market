import 'package:flutter/cupertino.dart';

import '../../../../core/colors.dart';
import '../../../../core/widgets/main_square_button.dart';

class CatalogueBuyButton extends StatelessWidget {
  const CatalogueBuyButton({super.key,this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      child: MainSquareButton(image: Image.asset('assets/images/shopping_cart.png',
        width: 24,height: 24,
        color: Colors.orange500,
      ),
        onTap:onTap
      ),
    );
  }
}
