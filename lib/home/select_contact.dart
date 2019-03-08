import 'package:flutter/material.dart';
import '../chat_list/chat_room.dart';

class SelectContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Contact'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('contact $index'),
            subtitle: Text('contact $index\'s status...'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ChatRoom();
              }));
            },
          );
        },
      ),
    );
  }
}
