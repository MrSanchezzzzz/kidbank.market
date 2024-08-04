import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';

class AddItemsButton extends StatefulWidget {
  const AddItemsButton({
    super.key,
    required this.whdth,
    required this.height,
    required this.add,
  });
  final double whdth;
  final double height;
  final Function add;

  @override
  State<AddItemsButton> createState() => _AddItemsButtonState();
}

class _AddItemsButtonState extends State<AddItemsButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.orange100,
      ),
      width: widget.whdth,
      height: widget.height,
      child: Center(
        child: Text(
          '+',
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: Colors.orange500,
                fontSize: 25,
              ),
        ),
      ),
    );
  }
}
