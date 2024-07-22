import 'package:flutter/cupertino.dart';

import '../../colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key,this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
        color: Colors.purple600,
        ),
        child: Center(
          child: Icon(CupertinoIcons.plus,color: Colors.white100,),
        ),
      ),
    );
  }
}
