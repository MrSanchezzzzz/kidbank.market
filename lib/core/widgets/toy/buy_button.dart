import 'package:flutter/cupertino.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../colors.dart';
import '../main_square_button.dart';

class CatalogueBuyButton extends StatelessWidget {
  const CatalogueBuyButton({super.key,this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Bone.square(size: 44,borderRadius: BorderRadius.circular(14),),
      ),
      child: SizedBox(
        width: 44,
        child: MainSquareButton(image: Image.asset('assets/images/shopping_cart.png',
          width: 24,height: 24,
          color: Colors.orange500,
        ),
          onTap:onTap
        ),
      ),
    );
  }
}
