import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/account/rating/components/rating_appbar.dart';

class RatingInfo extends StatelessWidget {
  const RatingInfo({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            children: [
              RatingNavbar(rating: rating,)
            ],
          ),
        )
    );
  }
}
