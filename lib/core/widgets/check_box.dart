import 'package:flutter/cupertino.dart';

import '../colors.dart';

class MainCheckBox extends StatelessWidget {
  const MainCheckBox({super.key,required this.value, this.onChanged,this.enabled=true;});
  final bool value;
  final Function(bool?)? onChanged;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return CupertinoCheckbox(
        value: value,
        onChanged: enabled?onChanged:null,
      inactiveColor: enabled?Colors.grey400:Colors.grey200,
      activeColor: enabled?Colors.purple600:Colors.grey200,
      focusColor: Colors.purple300,
      checkColor: Colors.white100,
    );
  }
}
