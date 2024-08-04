import 'package:flutter/cupertino.dart';

class AddsItemIconsList extends StatefulWidget {
  const AddsItemIconsList({
    super.key,
    required this.whdth,
    required this.height,
 
  });
  final double whdth;
  final double height;


  @override
  State<AddsItemIconsList> createState() => _AddsItemIconsListState();
}

class _AddsItemIconsListState extends State<AddsItemIconsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        width: widget.whdth,
        height: widget.height,
        child: Center(
          child: Image.asset('/Users/igorgrebenyuk/Downloads/kidbank.market-grebenuyk/assets/images/rabbit.png')
        ),
      ),
    );
  }
}
