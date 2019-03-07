import 'package:flutter/material.dart';
import './tab_camera/tab_camera.dart';
import './chat_list/chat_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double _appBarTop = 0.0;
  TabController _tabController;

  double _getappBarHeight(BuildContext context) {
    final double kTabHeight = 46.0;
    final double kTextAndIconTabHeight = 72.0;
    final double inicatorHeight = 2.0;

    return kToolbarHeight +
        kTabHeight +
        inicatorHeight +
        MediaQuery.of(context).padding.top;
  }

  _buildAppBar() {
    return AppBar(
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
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.camera_alt),
          ),
          Tab(
            text: 'CHATS',
          ),
          Tab(
            text: 'STATUS',
          ),
          Tab(
            text: 'CALLS',
          ),
        ],
      ),
    );
  }

  _buildTabView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        TabCamera(),
        ChatList(),
        Center(
          child: Text('Tab 3'),
        ),
        Center(
          child: Text('Tab 4'),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4, initialIndex: 1);
    _tabController.animation.addListener(() {
      if (_tabController.animation.value <= 1.0) {
        final value = _tabController.animation.value;
        final appBarHeight = _getappBarHeight(context);

        setState(() {
          _appBarTop = -(1 - value) * appBarHeight;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final marginTopRaw = _appBarTop +
        _getappBarHeight(context) -
        MediaQuery.of(context).padding.top;
    final marginTop = marginTopRaw > 0 ? marginTopRaw : 0.0;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            right: 0.0,
            top: _appBarTop,
            child: Container(
              height: _getappBarHeight(context),
              child: _buildAppBar(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: marginTop,
            ),
            child: _buildTabView(),
          ),
        ],
      ),
    );
  }
}
