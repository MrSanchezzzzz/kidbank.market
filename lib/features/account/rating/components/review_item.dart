import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/account/rating/presentation/reply_screen.dart';

import '../../../../core/colors.dart';
import '../../../../core/images.dart';
import '../../../../core/models/reply_model.dart';
import '../../../../core/models/review_model.dart';
import 'orange_rating_star.dart';

class ReviewItem extends StatefulWidget {
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

  const ReviewItem({
    Key? key,
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
    this.communicationMark, required this.replies,
  }) : super(key: key);

  @override
  _ReviewItemState createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  bool isLiked = false;
  bool isDisliked = false;
  late int likeCount;
  late int dislikeCount;

  @override
  void initState() {
    super.initState();
    likeCount = widget.likeCount;
    dislikeCount = widget.dislikeCount;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        isLiked = false;
        likeCount--;
      } else {
        isLiked = true;
        likeCount++;
        if (isDisliked) {
          isDisliked = false;
          dislikeCount--;
        }
      }
    });
  }

  void toggleDislike() {
    setState(() {
      if (isDisliked) {
        isDisliked = false;
        dislikeCount--;
      } else {
        isDisliked = true;
        dislikeCount++;
        if (isLiked) {
          isLiked = false;
          likeCount--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoListTile(
                backgroundColorActivated: Colors.white100,
                padding: EdgeInsets.zero,
                leading: ClipOval(
                  child: account_photo,
                ),
                title: Text(
                  '${widget.name} ${widget.surname}',
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 16,
                    color: Colors.grey500,
                  ),
                ),
                trailing: Text(
                  widget.date,
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 13,
                    color: Colors.grey500,
                  ),
                ),
              ),

              if (widget.official != null && widget.official!.isNotEmpty) ...[
                Row(
                  children: [
                    SizedBox(width: 24, height: 24, child: check_mark,),
                    const SizedBox(width: 8,),
                    Text(
                      widget.official!,
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                        color: Colors.green200,
                        fontSize: 15
                      ),
                    )
                  ],
                )
              ],
              if (widget.productMark != null ||
                  widget.deadlinesMark != null ||
                  widget.communicationMark != null) ...[
                const SizedBox(height: 8),
                _ratingRow('Product: ', widget.productMark, context),
                _ratingRow('Deadlines: ', widget.deadlinesMark, context),
                _ratingRow('Communication: ', widget.communicationMark, context),
              ],
              const SizedBox(height: 8),
              Text(
                widget.textReview,
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 17,
                  color: Colors.grey500,
                ),
              ),
              const SizedBox(height: 8),
              if (widget.photoCount != null && widget.photoCount! > 0) ...[
                Wrap(
                  spacing: 16.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.spaceBetween,
                  children: List.generate(
                    widget.photoCount! > 5 ? 6 : widget.photoCount!,
                        (index) {
                      if (index < 5) {
                        return SizedBox(
                          child: photo_for_marks,
                        );
                      } else {
                        return _morePhotosWidget(
                            widget.photoCount! - 5, context);
                      }
                    },
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Row(
                children: [
                  CupertinoButton(
                    child: Row(
                      children: [
                        SizedBox(width: 16, height: 16, child: reply_icn),
                        const SizedBox(width: 5),
                        Text(style: CupertinoTheme.of(context)
                                .textTheme
                                .navActionTextStyle,
                            'Reply (' + widget.replies.length.toString()+')'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => ReplyScreen(review:
                          ReviewModel(
                            name: widget.name,
                            surname: widget.surname,
                            date: widget.date,
                            textReview: widget.textReview,
                            likeCount: likeCount,
                            dislikeCount: dislikeCount,
                            official: widget.official,
                            photoCount: widget.photoCount,
                            productMark: widget.productMark,
                            deadlinesMark: widget.deadlinesMark,
                            communicationMark: widget.communicationMark,
                            replies: widget.replies,
                          ),)
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  CupertinoButton(
                    onPressed: toggleLike,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: isLiked ? like_active : like_icn,
                        ),
                        if (likeCount > 0) ...[
                          Row(
                            children: [
                              const SizedBox(width: 4,),
                              Text(
                                likeCount > 99 ? '99+' : likeCount.toString(),
                                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                  fontSize: 13,
                                  color: Colors.grey500,
                                ),
                              ),
                            ],
                          )
                        ]
                      ],
                    ),
                  ),
                  CupertinoButton(
                    onPressed: toggleDislike,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: isDisliked ? dislike_active : dislike_icn,
                        ),
                        if (dislikeCount > 0) ...[
                          Row(
                            children: [
                              const SizedBox(width: 4,),
                              Text(
                                dislikeCount > 99 ? '99+' : dislikeCount.toString(),
                                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                  fontSize: 13,
                                  color: Colors.grey500,
                                ),
                              ),
                            ],
                          )
                        ]
                      ],
                    ),
                  ),
                  CupertinoButton(
                    child: SizedBox(width: 16, height: 16, child: report),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        )
      ],
    );
  }

  Widget _ratingRow(String label, double? rating, BuildContext context) {
    return rating != null
        ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 13),
        ),
        OrangeRatingStars(
          rating: rating,
          fullStarColor: Colors.grey300,
          emptyStarColor: Colors.grey300,
          halfStarColor: Colors.grey300,
        ),
      ],
    )
        : const SizedBox.shrink();
  }

  Widget _morePhotosWidget(int remainingCount, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            CupertinoColors.black.withOpacity(0.6),
            BlendMode.srcOver,
          ),
          child: SizedBox(
            child: photo_for_marks,
          ),
        ),
        Text(
          '+$remainingCount',
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontSize: 14,
            color: Colors.white100,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}