import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';

class ChatListNavbar extends StatelessWidget {
  const ChatListNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16,16,16,0),
      color: CupertinoTheme.of(context).barBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Chat',style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(
            fontSize: 34
          ),),
          CustomTextField.search()
        ],
      ),
    );
  }
}
