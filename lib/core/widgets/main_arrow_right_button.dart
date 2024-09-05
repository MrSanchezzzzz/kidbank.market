import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class MainArrowRightButton extends StatelessWidget {
  const MainArrowRightButton({super.key,this.label,this.onTap});
  final String? label;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){
        if(context.canPop()) {
          context.pop();
        }
        else if(Navigator.of(context).canPop()){
          Navigator.of(context).pop();
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(CupertinoIcons.chevron_forward,size: 24,),
          const SizedBox(width: 8,),
          label!=null?Text(label!,style: CupertinoTheme.of(context).textTheme.navActionTextStyle,):Container(),
        ],
      ),
    );
  }
}