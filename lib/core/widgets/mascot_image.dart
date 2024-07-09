import 'package:flutter/widgets.dart';

class MascotImage extends StatelessWidget {
  const MascotImage({super.key,this.image});
  final Image? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: image == null ? const Color(0xFFD9D9D9) : null,
        image: image != null
            ? DecorationImage(
          image: image!.image,
          fit: BoxFit.cover,
        )
            : null,
      ),
    );
  }
}
