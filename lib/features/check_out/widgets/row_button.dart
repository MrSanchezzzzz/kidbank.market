import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/widgets/main_arrow_right_button.dart';

class RowButton extends StatefulWidget {
  const RowButton(
      {super.key,
      required this.title,
      required this.rightIcon,
      this.leftComponent,
      this.additionalText,
      this.details,
      this.toggle,
      this.stars});

  final IconData rightIcon;
  final bool? leftComponent;
  final bool? additionalText;
  final bool? details;
  final String title;
  final bool? toggle;
  final bool? stars;

  @override
  State<RowButton> createState() => _RowButtonState();
}

class _RowButtonState extends State<RowButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey500,
                ),
          ),
          const MainArrowRightButton()
        ],
      ),
    );
  }
}
