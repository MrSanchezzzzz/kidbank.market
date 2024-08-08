import 'package:flutter/cupertino.dart';

import '../../../core/images.dart';
class RatingStars extends StatelessWidget {
  final double rating;
  final Color color;
  final double size;

  const RatingStars({
    required this.rating,
    this.color = const Color(0xFFD1D1D1),
    this.size = 13.33,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        Image image;
        if (index < rating.floor()) {
          image = full_star;
        } else if (index < rating) {
          image = full_star;
        } else {
          image = star;
        }
        return SizedBox(
          width: size,
          height: size,
          child: image,
        );
      }),
    );
  }
}