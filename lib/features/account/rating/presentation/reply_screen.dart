import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/images.dart';
import 'package:kidbank/core/models/review_model.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/features/account/rating/components/review_item.dart';
import 'package:overlay_support/overlay_support.dart';
import '../components/reply_item.dart';

class ReplyScreen extends StatelessWidget {
  final ReviewModel review;

  const ReplyScreen({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white100,
      navigationBar: CupertinoNavigationBar(
        leading: const MainBackButton(label: 'Back'),
        middle: const Text('Replies'),
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        border: const Border(bottom: BorderSide.none),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 16,
                color: CupertinoTheme.of(context).scaffoldBackgroundColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ReviewItem(
                  name: review.name,
                  surname: review.surname,
                  date: review.date,
                  textReview: review.textReview,
                  likeCount: review.likeCount,
                  dislikeCount: review.dislikeCount,
                  official: review.official,
                  photoCount: review.photoCount,
                  productMark: review.productMark,
                  deadlinesMark: review.deadlinesMark,
                  communicationMark: review.communicationMark,
                  replies: review.replies,
                  isReply: true,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40, right: 16, top: 16, bottom: 16),
                child: CustomTextField(
                  label: 'Reply',
                  placeholder: 'Enter your reply',
                ),
              ),
              ReplyItem(replies: review.replies),
            ],
          ),
        ),
      ),
    );
  }
}