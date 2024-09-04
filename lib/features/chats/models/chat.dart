import 'package:flutter/widgets.dart';

class Chat {
  final int id;
  final String? imageUrl;
  final String? title;
  final String? lastMessage;
  final int unreadCount;
  final DateTime? lastMessageTime;

  Chat({
    required this.id,
    this.imageUrl,
    this.title,
    this.lastMessage,
    this.unreadCount=0,
    this.lastMessageTime,
  });
}
