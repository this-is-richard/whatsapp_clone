import 'package:flutter/material.dart';
import './chat_list/chat_list.dart';
import './custom_camera/custom_camera.dart';

class Home extends StatelessWidget {
  final appBar = AppBar(
    title: Text('WhatsApp'),
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
    bottom: TabBar(
      tabs: <Widget>[
        Tab(icon: Icon(Icons.camera_alt)),
        Tab(text: 'CHATS'),
        Tab(text: 'STATUS'),
        Tab(text: 'CALLS'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: appBar,
        body: TabBarView(
          children: <Widget>[
            CustomCamera(),
            ChatList(),
            Text('status'),
            Text('calls'),
          ],
        ),
      ),
    );
  }
}
