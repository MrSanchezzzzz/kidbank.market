import 'package:flutter/cupertino.dart';

class ToyImage extends StatelessWidget {
  const ToyImage({super.key,this.image});
  final Image? image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1,
    child:image??Placeholder(),);
  }
}
