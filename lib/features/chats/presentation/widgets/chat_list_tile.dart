import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/badge.dart';
import 'package:kidbank/core/widgets/progress_indicator.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/colors.dart';
import '../../models/chat.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatListTile extends StatelessWidget {
  const ChatListTile({super.key,required this.chat});
  final Chat chat;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Skeleton.replace(
          replacement: Bone.circle(size: 48,),
          child: Image.network(
            chat.imageUrl??'',
            width: 48,
            height: 48,
            loadingBuilder: (context,child,progress){
              return const ProgressIndicator();
            },
            errorBuilder: (context,_,__){
              return Image.asset('assets/images/avatar.png',width: 48,height: 48,);
            },
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skeleton.replace(
                        replacement: Text(BoneMock.title),
                        child: Text(chat.title??'Title'),
                    ),
                    Skeleton.ignore(child: Text(timeago.format(chat.lastMessageTime??DateTime.now())))
                  ],
              ),
              const SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Skeleton.replace(
                      replacement: Text(BoneMock.subtitle),
                      child: Text(chat.lastMessage??'Title',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Skeleton.ignore(
                      child: chat.unreadCount>0?Badge(child: Text(chat.unreadCount.toString(),)):const SizedBox.shrink()
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
