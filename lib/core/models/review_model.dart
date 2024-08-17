
import 'package:kidbank/core/models/reply_model.dart';

class ReviewModel {
  final String name;
  final String surname;
  final String date;
  final String textReview;
  final int likeCount;
  final int dislikeCount;
  final String? official;
  final int? photoCount;
  final double? productMark;
  final double? deadlinesMark;
  final double? communicationMark;
  final List<ReplyModel> replies;

  ReviewModel({
    required this.name,
    required this.surname,
    required this.date,
    required this.textReview,
    required this.likeCount,
    required this.dislikeCount,
    required this.replies,
    this.official,
    this.photoCount,
    this.productMark,
    this.deadlinesMark,
    this.communicationMark,
  });
}