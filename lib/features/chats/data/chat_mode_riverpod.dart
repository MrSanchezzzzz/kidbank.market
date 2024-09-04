
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// False for unread chats
class ChatModeNotifier extends StateNotifier<bool>{
  ChatModeNotifier(super.state);
  void toggle()=>state=!state;
  void setValue(bool value)=>state=value;
}

final chatModeProvider=StateNotifierProvider<ChatModeNotifier,bool>((ref){
  return ChatModeNotifier(false);
});