import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class MainBackButton extends StatelessWidget {
  const MainBackButton({super.key,this.label,this.onTap});
  final String? label;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){context.pop();},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/back.png',height: 16,width: 8,),
          const SizedBox(width: 8,),
          label!=null?Text(label!,style: CupertinoTheme.of(context).textTheme.navActionTextStyle,):Container(),
        ],
      ),
    );
  }
}
