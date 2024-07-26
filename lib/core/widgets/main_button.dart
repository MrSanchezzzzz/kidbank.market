import 'package:flutter/cupertino.dart';

import '../colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key,this.text='',this.onTap,this.color,this.icon,this.pressedOpacity=0.4});
  final Color? color;
  final Function()? onTap;
  final String? text;
  final Image? icon;
  final double pressedOpacity;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
      onPressed: onTap,
      color: color??const Color(0xFFFFA34E),
      disabledColor: Colors.grey100,
      pressedOpacity: pressedOpacity,
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon==null?Container():Padding(
            padding: const EdgeInsets.only(right: 8),
            child: icon!,
          ),
          Text(
            text ?? '',
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              color: onTap==null?Colors.grey200:const Color(0xFF6A040F),
              fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }
}
