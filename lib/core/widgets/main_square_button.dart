import 'package:flutter/cupertino.dart';

import '../colors.dart';

class MainSquareButton extends StatefulWidget {
  const MainSquareButton({super.key,required this.image,this.onTap});
  final Image image;
  final Function()? onTap;
  @override
  State<MainSquareButton> createState() => _MainSquareButtonState();
}

class _MainSquareButtonState extends State<MainSquareButton> {
  bool isTappedDown=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isTappedDown?Colors.orange300:Colors.orange100
          ),
          padding: const EdgeInsets.all(8),
          child: Center(child: widget.image),
        ),
      ),
    );
  }
}
