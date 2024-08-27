import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../models/chat.dart';

int __chatsId=1;//TODO Remove kostyl
FutureProvider<List<Chat>> unreadChatsProvider=FutureProvider<List<Chat>>((ref) async{
  Random rnd=Random();
  await Future.delayed(Duration(seconds: rnd.nextInt(3)+1));
  return [
    Chat(id:__chatsId,title: BoneMock.name,lastMessage: BoneMock.words(8), lastMessageTime: DateTime(2024,8,24,12,0,0,0),unreadCount: 1),
    Chat(id:__chatsId,title: BoneMock.name,lastMessage: BoneMock.words(8), lastMessageTime: DateTime(2024,8,24,12,0,0,0),unreadCount: 100),
    Chat(id:__chatsId,title: BoneMock.name,lastMessage: BoneMock.words(8), lastMessageTime: DateTime(2024,8,24,12,0,0,0),unreadCount: 50),
    Chat(id:__chatsId,title: BoneMock.name,lastMessage: BoneMock.words(8), lastMessageTime: DateTime(2024,8,24,12,0,0,0),unreadCount: 25),
    Chat(id:__chatsId,title: BoneMock.name,lastMessage: BoneMock.words(8), lastMessageTime: DateTime(2024,8,24,12,0,0,0),unreadCount: 12),
  ];
});

FutureProvider<List<Chat>> allChatsProvider=FutureProvider<List<Chat>>((ref) async{
  Random rnd=Random();
  await Future.delayed(Duration(seconds: rnd.nextInt(3)+1));
  return List<Chat>.generate(50, (index){
    return Chat(id:__chatsId,title: BoneMock.name,lastMessage: BoneMock.words(8), lastMessageTime: DateTime(2024,8,24,12,0,0,0),unreadCount: 0);
  });
});
