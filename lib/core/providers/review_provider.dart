
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/review_model.dart';

final reviewProvider = StateProvider<List<ReviewModel>>((ref) {
  return [
    ReviewModel(
      name: 'John Doe',
      date: '2024/08/13',
      textReview: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco',
      photoCount: 6,
      productMark: 4.0,
      deadlinesMark: null,
      communicationMark: null,
    ),
    ReviewModel(
      name: 'John Doe',
      date: '2024/08/13',
      textReview: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco',
      photoCount: 6,
      productMark: 4.0,
      deadlinesMark: null,
      communicationMark: null,
    ),
  ];
});