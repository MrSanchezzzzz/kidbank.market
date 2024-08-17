import 'package:flutter/cupertino.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentValue = 0;

  void _increment() {
    setState(() {
      _currentValue++;
    });
  }

  void _decrement() {
    setState(() {
      
      _currentValue--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color:const Color(0xfffff1e4),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _decrement,
            child: const Icon(CupertinoIcons.minus, color: Color(0xFF730000)),
          ),
          Text(
            '$_currentValue',
            style: const TextStyle(
              fontSize: 24.0,
              color: Color(0xFF730000),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _increment,
            child: const Icon(CupertinoIcons.add, color: Color(0xFF730000)),
          ),
        ],
      ),
    );
  }
}