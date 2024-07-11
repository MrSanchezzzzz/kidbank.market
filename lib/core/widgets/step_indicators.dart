import 'package:flutter/cupertino.dart';

abstract class StepIndicators{
  static Widget completed(){
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(64),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF612FB1), width: 1),
        color: const Color(0xFF451690),
      ),
      child: Center(
        child: Transform.scale(
          scale: 0.5,
            child: Image.asset('lib/assets/images/checkmark.png',fit:BoxFit.fill,)
        ),
      ),
    );
  }
  static Widget inProgress(BuildContext context){
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        border: Border.all(color: const Color(0xFF9E9E9E)),
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
      ),
    );
  }

  static Widget next(BuildContext context){
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        border: Border.all(color: const Color(0xFF612FB1), width: 1),
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
      ),
      child: Center(
        child: Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: const Color(0xFF451690),
          ),
        ),
      ),
    );
  }
}