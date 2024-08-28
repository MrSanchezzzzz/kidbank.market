import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/colors.dart' as AppColors;
import '../../../../core/images.dart';
import '../../../../core/models/reply_model.dart';
import '../../../../core/widgets/custom_check_box.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/main_button.dart';

class ReplyItem extends StatelessWidget {
  final List<ReplyModel> replies;

  const ReplyItem({
    super.key,
    required this.replies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: replies.map((reply) {
        return ReplyTile(reply: reply);
      }).toList(),
    );
  }
}

class ReplyTile extends StatefulWidget {
  final ReplyModel reply;

  const ReplyTile({super.key, required this.reply});

  @override
  State<ReplyTile> createState() => _ReplyTileState();
}

class _ReplyTileState extends State<ReplyTile> {
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
    likeCount = widget.reply.likeCount;
    dislikeCount = widget.reply.dislikeCount;
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
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 8),
      child: Column(
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
                    '${widget.reply.name} ${widget.reply.surname}',
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 16,
                      color: AppColors.Colors.grey500,
                    ),
                  ),
                  trailing: Text(
                    widget.reply.date,
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 13,
                      color: AppColors.Colors.grey500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.reply.textReply,
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 17,
                    color: AppColors.Colors.grey500,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
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
                                    color: AppColors.Colors.grey500,
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
                                    color: AppColors.Colors.grey500,
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
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 1.0,
            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          ),
        ],
      ),
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
}