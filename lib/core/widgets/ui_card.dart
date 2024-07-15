import 'package:flutter/cupertino.dart';

import '../colors.dart';

class UiCard extends StatefulWidget {
  const UiCard({super.key,this.image,this.label});
  final Image? image;
  final String? label;
  @override
  State<UiCard> createState() => _UiCardState();
}

class _UiCardState extends State<UiCard> {
  bool checked=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          checked=!checked;
        });
      },
      child: Container(
        width: 171,
        height: 108,
        decoration: BoxDecoration(
          color: checked?Colors.purple200:Colors.white100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: checked?Colors.purple400:Colors.grey100)
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
                child: CupertinoCheckbox(
                  value: checked,
                  onChanged: (bool? value) {
                    setState(() {
                      checked=!checked;
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }
}
