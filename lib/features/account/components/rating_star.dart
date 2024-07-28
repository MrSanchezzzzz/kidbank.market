import 'package:flutter/cupertino.dart';

import '../../../core/colors.dart';
import '../../../core/images.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  const RatingStars({required this.rating, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Rating: ',
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontSize: 15,
            color: Colors.grey300,
          ),
        ),
        const SizedBox(width: 4),
        ...List.generate(5, (index) {
          return SizedBox(
            width: 16,
            height: 16,
            child: index < rating ? full_star : star,
          );
        }),
      ],
    );
  }
}