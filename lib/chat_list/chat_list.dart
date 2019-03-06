import 'package:flutter/material.dart';
import './chat_list_tile.dart';
import './chat_room.dart';

class ChatList extends StatelessWidget {
  _onTileTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return ChatRoom();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ChatListTile(
          Icon(Icons.person),
          'Alice',
          'hi there',
          '2:53 in the afternoon',
          () => _onTileTap(context),
          avatarRadius: 25.0,
        );
      },
    );
  }
}
