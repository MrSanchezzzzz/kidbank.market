import 'package:flutter/cupertino.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key,this.text='',this.onTap,this.color,this.icon});
  final Color? color;
  final Function()? onTap;
  final String? text;
  final Image? icon;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
      onPressed: onTap,
      color: color??const Color(0xFFFFA34E),
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon==null?Container():icon!,
          Text(
            text ?? '',
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              color: const Color(0xFF6A040F),
              fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }
}
