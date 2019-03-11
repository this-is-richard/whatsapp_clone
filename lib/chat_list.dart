import 'package:flutter/material.dart';
import './chat_room.dart';

final _chatData = List<Map<String, Object>>.generate(10, (int index) {
  return {
    'avatar': Icon(Icons.person),
    'name': 'Contact $index',
    'lastMessage': 'hi there',
    'lastSeen': '2:53 in the afternoon',
  };
});

class ChatItem {
  final Icon avatar;
  final String name;
  final String lastMessage;
  final String lastSeen;

  ChatItem.fromData(data)
      : this.avatar = data['avatar'],
        this.name = data['name'],
        this.lastMessage = data['lastMessage'],
        this.lastSeen = data['lastSeen'];
}

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _chatData.length,
      itemBuilder: (BuildContext context, int index) {
        final chatItem = ChatItem.fromData(_chatData[index]);
        final avatarRadius = 25.0;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return ChatRoom(chatItem);
              }),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: avatarRadius,
                  child: chatItem.avatar,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              chatItem.name,
                              style: Theme.of(context).textTheme.subhead,
                            ),
                          ),
                          Text(
                            chatItem.lastSeen,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          chatItem.lastMessage,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.caption.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
