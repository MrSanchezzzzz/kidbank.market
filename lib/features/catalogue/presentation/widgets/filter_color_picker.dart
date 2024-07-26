import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/color_picker.dart';

class FilterColorPicker extends StatefulWidget {
  const FilterColorPicker({super.key});

  @override
  State<FilterColorPicker> createState() => _FilterColorPickerState();
}

class _FilterColorPickerState extends State<FilterColorPicker> {
  Map<int,bool> selectedIndexes={};
  @override
  Widget build(BuildContext context) {
    const List<Color> colors =[
      Color(0xFFFFFFFF),
      Color(0xFFFF0909),
      Color(0xFFFFC0CB),
      Color(0xFFFFEC42),
      Color(0xFF007328),
      Color(0xFF9A339C),
      Color(0xFFA7A7A7),
      Color(0xFF845D32),
      Color(0xFF00BFFE),
      Color(0xFF000000),
    ];
    const LinearGradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF3395D2),
        Color(0x669346B1),
        Color(0x668E8DA5),
        Color(0x66BD8E37),
        Color(0x6649D598),
      ],
      stops: [
        0.1489,
        0.3396,
        0.5103,
        0.6777,
        0.8182,
      ],
    );
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:[
        for(int i=0;i<=colors.length;i++)...{
          Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return  ColorPicker(
              onSelected: (){
                setState(() {
                  selectedIndexes[i]=!(selectedIndexes[i]??false);
                });
              },
              selected: selectedIndexes[i]??false,
              color: i<colors.length?colors[i]:null,
              gradient: i==colors.length?gradient:null,
              displayBorder: i==0,
            );
          },
          )

        }
      ],
    );
  }
}
