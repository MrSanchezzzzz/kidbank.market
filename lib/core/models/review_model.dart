class ReviewModel {
  final String name;
  final String date;
  final String textReview;
  final int? photoCount;
  final double? productMark;
  final double? deadlinesMark;
  final double? communicationMark;

  ReviewModel({
    required this.name,
    required this.date,
    required this.textReview,
    this.photoCount,
    this.productMark,
    this.deadlinesMark,
    this.communicationMark,
  });

}