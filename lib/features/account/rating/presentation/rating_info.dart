import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/account/rating/components/rating_appbar.dart';
import 'package:kidbank/features/account/rating/components/review_item.dart';
import 'package:kidbank/features/account/rating/components/sorting_block.dart';

import '../../../../core/colors.dart';
import '../../../../core/models/review_model.dart';
import '../../../../core/providers/review_provider.dart';

class RatingInfo extends ConsumerWidget {
  const RatingInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref
        .watch(reviewProvider.state)
        .state;

    return CupertinoPageScaffold(
      backgroundColor: Colors.white100,
      child: SafeArea(
        child: Column(
          children: [
            RatingNavbar(rating: _calculateAverageRating(reviews)),
            const RatingSort(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return ReviewItem(
                    photoCount: review.photoCount,
                    name: review.name,
                    date: review.date,
                    textReview: review.textReview,
                    productMark: review.productMark,
                    deadlinesMark: review.deadlinesMark,
                    communicationMark: review.communicationMark,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateAverageRating(List<ReviewModel> reviews) {
    if (reviews.isEmpty) return 0.0;
    double totalRating = 0.0;
    int count = 0;

    for (var review in reviews) {
      if (review.productMark != null) {
        totalRating += review.productMark!;
        count++;
      }
    }

    return count == 0 ? 0.0 : totalRating / count;
  }
}