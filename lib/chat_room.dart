import 'package:flutter/material.dart';
import './chat_list.dart';
import './left_thread.dart';
import './right_thread.dart';
import './model/thread.dart';
import './send_message_bar.dart';

class ChatRoom extends StatefulWidget {
  final ChatItem chatItem;

  ChatRoom(this.chatItem);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final List<Thread> _threads = [
    Thread(fromSelf: false, message: 'Aloha !'),
    Thread(fromSelf: false, message: 'Nei dim ah'),
    Thread(fromSelf: true, message: '未死'),
    Thread(fromSelf: false, message: 'lets hang out a bit ?'),
    Thread(fromSelf: true, message: '好'),
  ];

  _buildAppBar() {
    final avatarRadius = 20.0;
    final defaultIconButtonPadding = 8.0;
    final leftOffset = -25.0;
    final titleLineHeight = 2.0;
    return AppBar(
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
                child: widget.chatItem.avatar,
              ),
            ),
            Positioned(
              left: leftOffset + avatarRadius * 2 + 8.0,
              top:
                  defaultIconButtonPadding + avatarRadius / 2 - titleLineHeight,
              child: Text(widget.chatItem.name),
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
    );
  }

  _buildBottomBar() {
    return SendMessageBar(_handleSubmitted);
  }

  _buildMessageDisplay() {
    return ListView.builder(
      itemCount: _threads.length,
      reverse: true,
      itemBuilder: (context, index) {
        final thread = _threads.reversed.toList()[index];
        final spacer = SizedBox(
          height: 8.0,
        );
        final List<Widget> children = [spacer];

        if (thread.fromSelf == true) {
          children.add(Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RightThread(
                  thread.message,
                  backgroundColor: Theme.of(context).indicatorColor,
                ),
              ],
            ),
          ));
        } else {
          children.add(Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LeftThread(
                  thread.message,
                  backgroundColor: Theme.of(context).accentColor,
                ),
              ],
            ),
          ));
        }

        return Column(
          children: children,
        );
      },
    );
  }

  void _handleSubmitted(String text) {
    setState(() {
      _threads.add(Thread(
        fromSelf: true,
        message: text,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: _buildMessageDisplay(),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }
}
