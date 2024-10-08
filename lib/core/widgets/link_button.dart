import 'package:flutter/cupertino.dart';

import '../colors.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({super.key,required this.text,this.onTap,this.fontColor,this.enabled=true});
  final String text;
  final Function()? onTap;
  final Color? fontColor;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: enabled?onTap:null,
      padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(text,style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          color: enabled?fontColor??Colors.purple600:Colors.grey200,
          decoration: TextDecoration.underline
        ),),
    );
  }
}
