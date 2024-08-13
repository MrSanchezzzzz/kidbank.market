import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/features/account/rating/components/orange_rating_star.dart';

import '../../../../core/providers/rating_provider.dart';

class RatingNavbar extends ConsumerWidget {
  const RatingNavbar({super.key, this.onSearch, required this.rating});
  final double rating;
  final Function(String)? onSearch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orangeRating = ref.watch(orangeStarsProvider);
    final greyRating = ref.watch(greyStarsProvider);
    return Container(
      decoration: BoxDecoration(color: CupertinoTheme.of(context).barBackgroundColor),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text('Rating', style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainBackButton(label: 'Back',)
                ],
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              Column(
                children: [
                  Text(orangeRating.toString(), style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 34),),
                  OrangeRatingStars(rating: orangeRating, emptyStarColor: Colors.orange300, fullStarColor: Colors.orange300, halfStarColor: Colors.orange300,)
                ],
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: Column(
                  children: [
                    _item('Product: ', greyRating, context),
                    _item('Delivery deadlines: ', greyRating, context),
                    _item('Communication: ', greyRating, context),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _item(String title, double rating, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 13),
          ),
        ),
        OrangeRatingStars(rating: rating, emptyStarColor: Colors.grey300, fullStarColor: Colors.grey300, halfStarColor: Colors.grey300,),
      ],
    );
  }
}