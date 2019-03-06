import 'package:flutter/material.dart';
import './chat_list/chat_list.dart';
import './tab_camera/tab_camera.dart';
import './tab_camera/camera_example.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  final _tabs = <Widget>[
    Tab(icon: Icon(Icons.camera_alt)),
    Tab(text: 'CHATS'),
    Tab(text: 'STATUS'),
    Tab(text: 'CALLS'),
  ];

  PreferredSizeWidget _buildTabs(BuildContext context) {
    return TabBar(
      controller: _tabController,
      onTap: (int index) {
        if (index == 0) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return Scaffold(
              body: TabCamera(),
            );
          })).then((_) {
            _tabController.animateTo(1);
          });
        }
      },
      tabs: _tabs,
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _tabs.length,
      initialIndex: 1,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      bottom: _buildTabs(context),
    );

    return Scaffold(
      appBar: appBar,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Text('Loading camera...'),
          ),
          ChatList(),
          Text('status'),
          Text('calls'),
        ],
      ),
    );
  }
}
