class ReplyModel {
  final String name;
  final String surname;
  final String date;
  final String textReply;
  final int likeCount;
  final int dislikeCount;

  ReplyModel({
    required this.name,
    required this.surname,
    required this.date,
    required this.textReply,
    required this.likeCount,
    required this.dislikeCount,
  });
}