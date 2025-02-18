import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidbank/core/widgets/custom_check_box.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';

import '../../../../core/colors.dart' as AppColors;
import '../../../../core/images.dart';
import '../../../../core/models/reply_model.dart';
import '../../../../core/widgets/main_button.dart';
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
  final VoidCallback? onReplyTap;
  final bool isReply;

  const ReviewItem({
    super.key,
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
    required this.replies,
    this.onReplyTap,
    this.isReply = false,
  });

  @override
  _ReviewItemState createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  bool isLiked = false;
  bool isDisliked = false;
  late int likeCount;
  late int dislikeCount;
  final List<String> _reports = [
    'Contains profanity, insults, or\nabusive language',
    'Includes personal attacks or threats\nagainst the seller or other users',
    'Promotes hate speech,\ndiscrimination, or intolerance',
    'Discloses private or sensitive\ninformation about the seller or other\nusers',
    'Includes links to malicious websites\nor content',
    'Promotes illegal activities or products',
    'Contains false, misleading, or\ndefamatory statements about the\nseller or product',
    'Violates the marketplace\'s terms of\nservice or community guidelines',
    'Appears to be spam, irrelevant, or\nunrelated to the actual purchase\nexperience',
    'Other'
  ];
  final List<String> _selectedReports = [];

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
                backgroundColorActivated: AppColors.Colors.white100,
                padding: EdgeInsets.zero,
                leading: ClipOval(
                  child: account_photo,
                ),
                title: Text(
                  '${widget.name} ${widget.surname}',
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 16,
                    color: AppColors.Colors.grey500,
                  ),
                ),
                trailing: Text(
                  widget.date,
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 13,
                    color: AppColors.Colors.grey500,
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
                        color: AppColors.Colors.green200,
                        fontSize: 15,
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
                  color: AppColors.Colors.grey500,
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
                        return _morePhotosWidget(widget.photoCount! - 5, context);
                      }
                    },
                  ),
                ),
              ],
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (!widget.isReply) ...[
                    CupertinoButton(
                      onPressed: widget.onReplyTap,
                      child: Row(
                        children: [
                          SizedBox(width: 16, height: 16, child: reply_icn),
                          const SizedBox(width: 5),
                          Text(
                            'Reply (${widget.replies.length})',
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navActionTextStyle,
                          ),
                        ],
                      ),
                    ),
                    ],
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
                            const SizedBox(width: 4,),
                            Text(
                              likeCount > 99 ? '99+' : likeCount.toString(),
                              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                fontSize: 13,
                                color: AppColors.Colors.grey500,
                              ),
                            ),
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
                            const SizedBox(width: 4,),
                            Text(
                              dislikeCount > 99 ? '99+' : dislikeCount.toString(),
                              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                fontSize: 13,
                                color: AppColors.Colors.grey500,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                    CupertinoButton(
                      child: SizedBox(width: 16, height: 16, child: report),
                      onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return _buildReportSheet(context);
                            },
                            isScrollControlled: true,
                            isDismissible: true,
                            enableDrag: true,
                          );
                        }
                    ),
                  ],
                ),
              ]
          ),
        ),
          Container(
            height: 1.0,
            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          )
        ]
    );
  }

  Widget _buildReportSheet(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Provide a reason for a report',
                          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: SizedBox(width: 16, height: 16, child: back_cross),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  for (int i = 0; i < _reports.length; i++)
                    Padding(
                      padding: EdgeInsets.only(left: 12, top: i == 0 ? 0 : 16, right: 16),
                      child: Row(
                        children: [
                          CustomCheckBox(
                            value: _selectedReports.contains(_reports[i]),
                            onChanged: (bool? isChecked) {
                              setState(() {
                                if (isChecked == true) {
                                  _selectedReports.add(_reports[i]);
                                } else {
                                  _selectedReports.remove(_reports[i]);
                                }
                              });
                            },
                          ),
                          Text(
                            _reports[i],
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  placeholder: 'Enter details of your report',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MainButton(
                  text: 'Send',
                  color: AppColors.Colors.orange300,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
          fullStarColor: AppColors.Colors.grey300,
          emptyStarColor: AppColors.Colors.grey300,
          halfStarColor: AppColors.Colors.grey300,
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
            color: AppColors.Colors.white100,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}