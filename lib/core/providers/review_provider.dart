
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/review_model.dart';

final reviewProvider = StateProvider<List<ReviewModel>>((ref) {
  return [
    ReviewModel(
      name: 'Name',
      surname: 'Surname',
      date: '2024/08/13',
      official: 'Bought: Pink dragon',
      likeCount: 200,
      dislikeCount: 4,
      textReview: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco',
      photoCount: 3,
      productMark: 4.0,
      deadlinesMark: null,
      communicationMark: null,
    ),
    ReviewModel(
      name: 'Name',
      surname: 'Surname',
      date: '2024/08/13',
      likeCount: 18,
      dislikeCount: 102,
      textReview: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco',
      photoCount: 8,
      productMark: 4.0,
      deadlinesMark: 1.0,
      communicationMark: 5.0,
    ),
  ];
});