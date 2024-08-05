import 'package:flutter/cupertino.dart';

import 'colors.dart';

class MainAddButton extends StatefulWidget {
  const MainAddButton({super.key});

  @override
  State<MainAddButton> createState() => _MainAddButtonState();
}

class _MainAddButtonState extends State<MainAddButton> {
  bool isTappedDown=false;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isTappedDown?Colors.orange300:Colors.orange100
        ),
        padding: EdgeInsets.all(8),
        child: Center(child: Image.asset('assets/images/add.png')),
      ),
    );
  }
}
