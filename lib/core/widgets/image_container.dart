import 'package:flutter/widgets.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key,this.image,this.width,this.height});
  final Image? image;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFD9D9D9)
      ),
    );
  }
}
