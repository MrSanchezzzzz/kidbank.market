import 'package:flutter/cupertino.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.title,
    required this.fSize,
    required this.clr,
    required this.fontWeight,
  });
  final String title;
  final double fSize;
  final Color clr;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                fontSize: fSize, color: clr, fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
