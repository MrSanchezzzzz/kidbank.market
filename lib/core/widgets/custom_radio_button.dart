import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';

class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton({super.key,required this.value,required this.groupValue,this.onChanged,this.enabled=true,this.toggleable=false});
  final T value;
  final T groupValue;
  final Function(T)? onChanged;
  final bool enabled;
  final bool toggleable;
  @override
  Widget build(BuildContext context) {
    return CupertinoRadio<T>(
      inactiveColor: enabled?Colors.grey300:Colors.grey200,
        activeColor: enabled?Colors.purple600:Colors.grey200,
        value: value,
        fillColor: const Color(0xFFFFFFFF),
        groupValue: groupValue,
        onChanged: enabled?(v){if(onChanged!=null){onChanged!(v as T);}}:null,
        toggleable: toggleable,
    );
  }
}
