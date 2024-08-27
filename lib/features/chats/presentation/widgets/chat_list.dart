import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/widgets/progress_indicator.dart';
import 'package:kidbank/features/chats/data/chat_mode_riverpod.dart';
import 'package:kidbank/features/chats/data/chats_riverpod.dart';
import 'package:kidbank/features/chats/presentation/widgets/chat_list_tile.dart';
import 'package:kidbank/features/chats/presentation/widgets/no_chats.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../models/chat.dart';

class ChatList extends ConsumerWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    bool mode=ref.watch(chatModeProvider);
    final chats=mode?ref.watch(allChatsProvider):ref.watch(unreadChatsProvider);
    return chats.when(
        data: (data){
          if(data.isEmpty) {
            return NoChats();
          }
          return ListView.separated(
              itemCount: chats.value!.length,
              itemBuilder: (context,index){
                return ChatListTile(chat: chats.value![index]);
              },
              separatorBuilder: (_,__)=>SizedBox(height: 16,),
              );
        },
        error: (_,__)=>const Center(child: Text('error'),),
        loading: (){
          return Skeletonizer(
            enabled: true,
              child: ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return ChatListTile(chat: Chat(id: -1));
                  },
                separatorBuilder: (_,__)=>SizedBox(height: 16,),
              )
          );
        }
    );
  }
}
