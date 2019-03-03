import 'package:flutter/material.dart';

class ChatListItem {
  final Icon avatar;
  final String name;
  final String lastMessage;
  final String lastSeen;

  ChatListItem.fromData(data)
      : this.avatar = data['avatar'],
        this.name = data['name'],
        this.lastMessage = data['lastMessage'],
        this.lastSeen = data['lastSeen'];
}
