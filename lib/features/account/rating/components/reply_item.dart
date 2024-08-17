import 'package:flutter/cupertino.dart';
import '../../../../core/colors.dart';
import '../../../../core/images.dart';
import '../../../../core/models/reply_model.dart';

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
                  backgroundColorActivated: Colors.white100,
                  padding: EdgeInsets.zero,
                  leading: ClipOval(
                    child: account_photo,
                  ),
                  title: Text(
                    '${widget.reply.name} ${widget.reply.surname}',
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 16,
                      color: Colors.grey500,
                    ),
                  ),
                  trailing: Text(
                    widget.reply.date,
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 13,
                      color: Colors.grey500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.reply.textReply,
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 17,
                    color: Colors.grey500,
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
          ),
        ],
      ),
    );
  }
}