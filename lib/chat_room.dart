import 'package:flutter/material.dart';
import './chat_list.dart';
import './clip_r_thread.dart';

class ChatRoom extends StatelessWidget {
  final ChatItem chatItem;

  ChatRoom(this.chatItem);

  @override
  Widget build(BuildContext context) {
    final _chatThreads = ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        final r = 2.5;
        final thread = ClipPath(
          clipper: ClipRThread(r),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(r)),
            child: Container(
              padding: EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
              color: Color(0xFFdcf8c6),
              child: Text('Hi there $index'),
            ),
          ),
        );
        return Column(
          children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            thread,
          ],
        );
      },
    );

    final roundedContainer = ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(width: 8.0),
            Icon(Icons.insert_emoticon,
                size: 30.0, color: Theme.of(context).hintColor),
            SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(Icons.attach_file,
                size: 30.0, color: Theme.of(context).hintColor),
            SizedBox(width: 8.0),
            Icon(Icons.camera_alt,
                size: 30.0, color: Theme.of(context).hintColor),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );

    final inputBar = Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: roundedContainer,
          ),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              child: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );

    final avatarRadius = 20.0;
    final defaultIconButtonPadding = 8.0;
    final leftOffset = -25.0;
    final titleLineHeight = 2.0;

    final scaffold = Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: AppBar(
        title: SizedBox(
          width: double.infinity,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                left: leftOffset,
                top: defaultIconButtonPadding,
                child: CircleAvatar(
                  radius: avatarRadius,
                  child: chatItem.avatar,
                ),
              ),
              Positioned(
                left: leftOffset + avatarRadius * 2 + 8.0,
                top: defaultIconButtonPadding +
                    avatarRadius / 2 -
                    titleLineHeight,
                child: Text(chatItem.name),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _chatThreads,
          ),
          inputBar,
        ],
      ),
    );

    return SafeArea(
      top: false,
      bottom: true,
      child: scaffold,
    );
  }
}
