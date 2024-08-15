import 'package:flutter/cupertino.dart';

import '../../../../core/colors.dart';
import '../../../../core/images.dart';
import 'orange_rating_star.dart';

class ReviewItem extends StatefulWidget {
  final String name;
  final String date;
  final String textReview;
  final int? photoCount;
  final double? productMark;
  final double? deadlinesMark;
  final double? communicationMark;

  const ReviewItem({
    Key? key,
    required this.name,
    required this.date,
    required this.textReview,
    this.photoCount,
    this.productMark,
    this.deadlinesMark,
    this.communicationMark,
  }) : super(key: key);

  @override
  _ReviewItemState createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  bool isLiked = false;
  bool isDisliked = false;

  void toggleLike() {
    setState(() {
      if (isLiked) {
        isLiked = false;
      } else {
        isLiked = true;
        isDisliked = false;
      }
    });
  }

  void toggleDislike() {
    setState(() {
      if (isDisliked) {
        isDisliked = false;
      } else {
        isDisliked = true;
        isLiked = false;
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
                  widget.name,
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
                        Text('Reply',
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navActionTextStyle),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  CupertinoButton(
                    onPressed: toggleLike,
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: isLiked ? like_active : like_icn,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: toggleDislike,
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: isDisliked ? dislike_active : dislike_icn,
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