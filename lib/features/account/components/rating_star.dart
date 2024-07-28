import 'package:flutter/cupertino.dart';

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
      children: [
        Text(
          'Rating: ',
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontSize: 15,
            color: color,
          ),
        ),
        ...List.generate(5, (index) {
          IconData icon;
          if (index < rating.floor()) {
            icon = CupertinoIcons.star_fill;
          } else if (index < rating) {
            icon = CupertinoIcons.star_lefthalf_fill;
          } else {
            icon = CupertinoIcons.star;
          }
          return SizedBox(
            width: size,
            height: size,
            child: Icon(
              icon,
              color: color,
              size: size,
            ),
          );
        }),
      ],
    );
  }
}