import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/custom_check_box.dart';

import '../colors.dart';

class UiCard extends StatefulWidget {
  const UiCard({super.key,this.image,this.label,this.onChanged,this.checked=false,this.width=171,this.height=108,this.selectable=true});
  final Image? image;
  final String? label;
  final bool checked;
  final Function()? onChanged;
  final double width;
  final double height;
  final bool selectable;
  @override
  State<UiCard> createState() => _UiCardState();

  factory UiCard.large({Image? image,String? label, Function()? onChanged,bool checked=false,}){
    return UiCard(image: image,label: label,onChanged: onChanged,checked: checked,height: 180,);
  }

  factory UiCard.parent({Function()? onChanged,bool checked=false}){
    return UiCard.large(
      image: Image.asset('assets/images/mascot_adult.png',width: 100,height: 110,),
      label: 'Parent',
      onChanged: onChanged,
      checked: checked,
      );
  }

  factory UiCard.child({Function()? onChanged,bool checked=false}){
    return UiCard.large(
      image: Image.asset('assets/images/mascot_kid.png',width: 100,height: 110,),
      label: 'Child',
      onChanged: onChanged,
      checked: checked,
    );
  }

  factory UiCard.notSelectable({Image? image,String? label,Function()? onTap}){
    return UiCard(image: image,label: label,selectable: false,onChanged: onTap,);
  }

}

class _UiCardState extends State<UiCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.onChanged!=null){
          widget.onChanged!();
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.checked?Colors.purple200:Colors.white100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: widget.checked?Colors.purple400:Colors.grey100)
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.image??Image.asset(
                  'assets/images/teddybear.png',
                  width: 44,
                  height: 44,
                ),
                const SizedBox(height: 8,),
                widget.label!=null?Text(widget.label!,style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontWeight: FontWeight.w700
                ),)
                    :Container()
              ],
            ),
            if(widget.selectable)
            Positioned(
                left: 0,
                top: 0,
                child: CustomCheckBox(
                  value: widget.checked,
                  onChanged: (_){
                    if(widget.onChanged!=null){
                      widget.onChanged!();
                    }
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}
