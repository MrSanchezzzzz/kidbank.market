import 'package:flutter/cupertino.dart';

import '../colors.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, this.selected = false, this.color,this.gradient, this.size = 60,this.displayBorder=true, this.onSelected});

  final bool selected;
  final Color? color;
  final LinearGradient? gradient;
  final double size;
  final bool displayBorder;
  final Function()? onSelected;

  factory ColorPicker.small({bool selected = false, Color? color, Function()? onSelected}) {
    return ColorPicker(
      color: color,
      selected: selected,
      size: 16,
      onSelected: onSelected,
    );
  }

  factory ColorPicker.medium({bool selected = false, Color? color, Function()? onSelected}) {
    return ColorPicker(
      color: color,
      selected: selected,
      size: 40,
      onSelected: onSelected,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: selected ? Colors.grey200 : Colors.grey100, width: selected ? 3 : displayBorder?1:0),
            shape: BoxShape.circle),
        padding: EdgeInsets.all(selected ? 3 : 0),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: color,gradient: gradient),
        ),
      ),
    );
  }
}
