import 'package:flutter/cupertino.dart';

import '../colors.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({super.key,required this.text,this.onPressed,this.fontColor,this.enabled=true});
  final String text;
  final Function()? onPressed;
  final Color? fontColor;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Text(text,style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          color: enabled?fontColor??Colors.purple600:Colors.grey200,
          decoration: TextDecoration.underline
        ),),
        onPressed: enabled?onPressed:null
    );
  }
}
