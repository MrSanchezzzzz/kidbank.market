class ReviewModel {
  final String name;
  final String surname;
  final String date;
  final String? official;
  final String textReview;
  final int? photoCount;
  final int likeCount;
  final int dislikeCount;
  final double? productMark;
  final double? deadlinesMark;
  final double? communicationMark;

  ReviewModel({
    required this.name,
    required this.surname,
    required this.date,
    required this.textReview,
    required this.likeCount,
    required this.dislikeCount,
    this.official,
    this.photoCount,
    this.productMark,
    this.deadlinesMark,
    this.communicationMark,
  });

}