import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/custom_check_box.dart';

import '../colors.dart';

class UiCard extends StatefulWidget {
  const UiCard({super.key,this.image,this.label,this.onChanged,this.checked=false});
  final Image? image;
  final String? label;
  final bool checked;
  final Function()? onChanged;
  @override
  State<UiCard> createState() => _UiCardState();
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
        width: 171,
        height: 108,
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
                widget.label!=null?Text(widget.label!,style: CupertinoTheme.of(context).textTheme.textStyle,)
                    :Container()
              ],
            ),
            Positioned(
                left: 0,
                top: 0,
                //TODO Custom checkbox
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
