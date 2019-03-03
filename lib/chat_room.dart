import 'dart:math';
import 'package:flutter/material.dart';
import './chat_list.dart';

final chatRadius = 15.0;

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

    final roundedInput = Container(
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
    );

    final bottomBar = Row(
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: roundedInput,
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
                child: Column(
                  children: <Widget>[
                    Text('hi'),
                    Text('hihihi'),
                    ClipPath(
                      clipper: ClipRTriangle(),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(chatRadius)),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          color: Colors.redAccent,
                        ),
                      ),
                    )
                  ],
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

class ClipRTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // final path = Path();
    // final r = chatRadius;

    // path.lineTo(0.0, r);
    // path.conicTo(r - r * sin(0.785), r + r * cos(0.785), r - r * sin(0.393),
    //     r + cos(0.393), 1);

    // path.moveTo(r, size.height);

    // path.moveTo(size.width, size.height);
    // path.moveTo(size.width, 0.0);

    // path.close();
    // return path;

    final path = Path();
    path.lineTo(0.0, chatRadius);
    // path.lineTo(chatRadius, chatRadius + chatRadius / 2);
    final r = chatRadius;
    final angle = 0.785;
    path.conicTo(r - r * sin(angle), r + r * cos(angle),
        r - r * sin(angle * 0.5), r + r * cos(angle * 0.5), 1);

    final moveIn = 2 * r;
    path.lineTo(moveIn, r + moveIn * tan(angle));

    path.lineTo(moveIn, size.height - chatRadius);

    path.conicTo(
        moveIn + chatRadius * 2 - chatRadius * sin(0.785),
        size.height - (chatRadius - chatRadius * cos(0.785)),
        moveIn + chatRadius * 2,
        size.height,
        1);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
