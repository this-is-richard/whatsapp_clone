import 'package:flutter/material.dart';
import './chat_list.dart';

class ChatRoom extends StatelessWidget {
  final ChatItem chatItem;

  ChatRoom(this.chatItem);

  @override
  Widget build(BuildContext context) {
    final avatarRadius = 20.0;
    final defaultIconButtonPadding = 8.0;
    final leftOffset = -25.0;
    final titleLineHeight = 2.0;

    final appBar = AppBar(
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
              top:
                  defaultIconButtonPadding + avatarRadius / 2 - titleLineHeight,
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
    );

    final bottomBar = Row(
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 8.0,
                  ),
                  Icon(
                    Icons.insert_emoticon,
                    size: 30.0,
                    color: Theme.of(context).hintColor,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.attach_file,
                    size: 30.0,
                    color: Theme.of(context).hintColor,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Icon(
                    Icons.camera_alt,
                    size: 30.0,
                    color: Theme.of(context).hintColor,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        CircleAvatar(
          child: Icon(Icons.mic),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: appBar,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: ClipPath(
                    clipper: MessageClipper(),
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(8.0),
                      child: Text('hihihihii'),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: bottomBar,
            )
          ],
        ),
      ),
    );
  }
}

class MessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(10.0, size.height);
    path.lineTo(10.0, 10.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(MessageClipper oldClipper) => false;
}
