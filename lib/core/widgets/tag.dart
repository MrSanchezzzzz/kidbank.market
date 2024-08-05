import 'package:flutter/cupertino.dart';

import '../colors.dart';

class Tag extends StatefulWidget {
  const Tag({super.key,this.prefixIcon,this.text='',this.suffixIcon});
  final Widget? prefixIcon;
  final String text;
  final Widget? suffixIcon;

  @override
  State<Tag> createState() => _TagState();
  
  factory Tag.closeButton({Widget? prefixIcon,String text='',Function()? onClose}){
    return Tag(
      prefixIcon: prefixIcon,
      text: text,
      suffixIcon: GestureDetector(onTap:onClose,child: Image.asset('assets/images/close_circle.png',width: 17,height: 17,color: Colors.orange400,)),
    );
  }
}

class _TagState extends State<Tag> {
  bool isTappedDown=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_){
        setState(() {
          isTappedDown=true;
        });
      },
      onTapUp: (_){
        setState(() {
          isTappedDown=false;
        });
      },
      onTapCancel: (){
          setState(() {
            isTappedDown=false;
          });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isTappedDown?Colors.orange300:Colors.orange200
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.prefixIcon!=null?
                Padding(padding: EdgeInsets.only(right: 8),
                child: widget.prefixIcon!,):Container(),
            Text(widget.text,style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 15,
              color: Colors.orange500
            ),),
            widget.suffixIcon!=null?
            Padding(padding: EdgeInsets.only(left: 8),
              child: widget.suffixIcon!,):Container(),
          ],
        ),
      ),
    );
  }
}
