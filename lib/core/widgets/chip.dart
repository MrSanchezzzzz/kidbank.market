import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';

class Chip extends StatefulWidget {
  const Chip({super.key,this.label,this.onTap,this.selected=false,this.enabled=true});
  final String? label;
  final Function()? onTap;
  final bool selected;
  final bool enabled;
  @override
  State<Chip> createState() => _ChipState();
}

class _ChipState extends State<Chip> {
  Color color=Colors.orange100;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 44,
      child: GestureDetector(
        onTapDown: (details){
          setState(() {
            color=Colors.orange200;
          });
        },
        onTapUp: (details){
          setState(() {
            color=Colors.orange100;
          });
          if(widget.onTap!=null) {
            widget.onTap!();
          }
        },
        onTapCancel: (){
          setState(() {
            color=Colors.orange100;
          });
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: widget.enabled?color:Colors.grey100,
              border: widget.selected&&widget.enabled?Border.all(color: Colors.orange500):null
            ),
            child: Center(
                child: Text(widget.label??'',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 15,
                  color: widget.enabled?Colors.orange500:Colors.grey200
                ),)
            )
        ),
      ),
    );
  }
}
