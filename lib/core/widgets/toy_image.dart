import 'package:flutter/cupertino.dart';

import '../colors.dart';

class ToyImage extends StatelessWidget {
  const ToyImage({super.key,this.image});
  final Image? image;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        color: Colors.grey100,
        borderRadius: BorderRadius.circular(16)
    ),
    padding: const EdgeInsets.all(16),
      child: AspectRatio(aspectRatio: 1,
      child:image??const Placeholder(),),
    );
  }
}
