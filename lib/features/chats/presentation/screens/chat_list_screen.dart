import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/chats/data/chat_mode_riverpod.dart';
import 'package:kidbank/features/chats/data/unread_count_riverpod.dart';
import 'package:kidbank/features/chats/presentation/widgets/chat_list.dart';
import 'package:kidbank/features/chats/presentation/widgets/chat_list_navbar.dart';
import 'package:kidbank/features/chats/presentation/widgets/unread_counter.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/colors.dart';
import '../../../../core/widgets/tab_selector/tab_selector.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  void selectMode(WidgetRef ref,bool value){
    bool mode=ref.read(chatModeProvider);
    if(mode==value){
      return;
    }
    ref.read(chatModeProvider.notifier).setValue(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white100,
          child: Column(
            children: [
              const ChatListNavbar(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    TabSelector(
                      labels: const [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Unread'),
                            SizedBox(width: 8),
                            UnreadCounter(),
                          ],
                        ),
                        Text('All'),
                      ],
                      callbacks: [
                        ()=>selectMode(ref,false),
                        ()=>selectMode(ref,true),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              // Ensure that only this part is expanded
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ChatList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
