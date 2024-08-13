import 'package:flutter/cupertino.dart';
class OrangeRatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final double spacing;
  final Color fullStarColor;
  final Color halfStarColor;
  final Color emptyStarColor;

  const OrangeRatingStars({
    required this.rating,
    this.size = 13.33,
    this.spacing = 4.0,
    this.fullStarColor = const Color(0xFFFFA500),
    this.halfStarColor = const Color(0xFFFFA500),
    this.emptyStarColor = const Color(0xFFC0C0C0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int index = 0; index < 5; index++) {
      if (index < rating.floor()) {
        stars.add(SizedBox(
          width: size,
          height: size,
          child: Image.asset(
            'assets/images/orange_star.png',
            color: fullStarColor,
            fit: BoxFit.contain,
          ),
        ));
      } else if (rating - index > 0.5) {
        stars.add(SizedBox(
          width: size,
          height: size,
          child: Image.asset(
            'assets/images/orange_halfstar.png',
            color: halfStarColor,
            fit: BoxFit.contain,
          ),
        ));
      } else {
        stars.add(SizedBox(
          width: size,
          height: size,
          child: Image.asset(
            'assets/images/orange_emptystar.png',
            color: emptyStarColor,
            fit: BoxFit.contain,
          ),
        ));
      }
      if (index < 4) {
        stars.add(SizedBox(width: spacing));
      }
    }

    return Row(
      children: stars,
    );
  }
}