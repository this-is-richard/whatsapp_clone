import 'package:flutter/material.dart';
import './model/chat_list_item.dart';
import './chat_thread.dart';
import './model/thread.dart';
import './send_message_bar.dart';

class ChatRoom extends StatefulWidget {
  final ChatListItem chatItem;

  ChatRoom(this.chatItem);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> with TickerProviderStateMixin {
  final List<ChatThread> _chatThreads = [];

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
      itemCount: _chatThreads.length,
      reverse: true,
      itemBuilder: (context, index) {
        final _chatThread = _chatThreads.reversed.toList()[index];
        final spacer = SizedBox(
          height: 8.0,
        );

        final List<Widget> children = [
          spacer,
          _chatThread,
        ];

        return Column(
          children: children,
        );
      },
    );
  }

  void _handleSubmitted(String text) {
    final chatThread = ChatThread(
      Thread(
        fromSelf: true,
        message: text,
      ),
      AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 800),
      ),
    );

    setState(() {
      _chatThreads.add(chatThread);
    });

    chatThread.animationController.forward();
  }

  @override
  void initState() {
    print('==== ChatRoom initState ====');

    [
      Thread(fromSelf: false, message: 'Aloha !'),
      Thread(fromSelf: false, message: 'Nei dim ah'),
      Thread(fromSelf: true, message: '未死'),
      Thread(fromSelf: false, message: 'lets hang out a bit ?'),
      Thread(fromSelf: true, message: '好'),
    ].forEach((thread) {
      final chatThead = ChatThread(
        thread,
        AnimationController(
          vsync: this,
          duration: Duration(
            milliseconds: 800,
          ),
        ),
      );

      _chatThreads.add(chatThead);

      chatThead.animationController.forward();
    });
    super.initState();
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

  @override
  void dispose() {
    for (var chatThread in _chatThreads) {
      chatThread.animationController.dispose();
    }
    super.dispose();
  }
}
