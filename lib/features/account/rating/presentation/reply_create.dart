import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/models/review_model.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/account/rating/components/notify_reply.dart';
import '../components/review_item.dart';

class ReplyCreateScreen extends StatelessWidget {
  final ReviewModel review;

  const ReplyCreateScreen({super.key, required this.review});

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
      child: Column(
        children: [
          Container(height: 16, color: CupertinoTheme.of(context).scaffoldBackgroundColor),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ReviewItem(
              name: review.name,
              surname: review.surname,
              date: review.date,
              textReview: review.textReview,
              official: review.official,
              photoCount: review.photoCount,
              productMark: review.productMark,
              deadlinesMark: review.deadlinesMark,
              communicationMark: review.communicationMark,
              likeCount: 0,
              dislikeCount: 0,
              replies: [],
              isReply: true,
            ),
          ),
          const SizedBox(height: 8),

          Expanded(
            child: Container(
              color: CupertinoTheme.of(context).scaffoldBackgroundColor,
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: CustomTextField(
                      label: 'Reply',
                      placeholder: 'Enter your reply',
                      required: true,
                      maxLines: 4,
                      helpText: '0/2000',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: NotifyReply(),
                  ),
                  Spacer(), // Додаємо Spacer тут
                  Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
                    child: MainButton(
                      text: 'Send',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}