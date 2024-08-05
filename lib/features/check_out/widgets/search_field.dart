import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key, required this.icon, required this.text});
  final String icon;
  final String text;

  @override
  State<SearchField> createState() => _SearchFieldtState();
}

class _SearchFieldtState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: Colors.grey100,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      width: 358,
      height: 44,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                widget.icon,
              ),
            ),
          )
        ],
      ),
    );
  }
}
