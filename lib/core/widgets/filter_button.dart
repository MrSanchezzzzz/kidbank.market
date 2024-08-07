import 'package:flutter/cupertino.dart';

import '../colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key,this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset('assets/images/filter.png',width: 24,height: 24,)
    );
  }
}
