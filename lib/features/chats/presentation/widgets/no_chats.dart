import 'package:flutter/cupertino.dart';

class NoChats extends StatelessWidget {
  const NoChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/message.png',width: 48,height: 48,),
          SizedBox(height: 8,),
          Text('No messages yet',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontSize: 34
          ),),
          SizedBox(height: 8,),
          Text('When you receive a new message, it will appear here.')
        ],
    );
  }
}
