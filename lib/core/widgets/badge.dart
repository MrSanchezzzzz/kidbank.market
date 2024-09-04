import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';

class Badge extends StatelessWidget {
  const Badge({super.key,this.enabled=true,this.child});
  final bool enabled;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: enabled?Colors.orange200:Colors.orange100
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
      child:  child,
    );
  }
}
