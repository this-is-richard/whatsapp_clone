import 'package:flutter/material.dart';
import './tab_camera/tab_camera.dart';
import './chat_list/chat_list.dart';
import './select_contact.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double _appBarTop = 0.0;
  TabController _tabController;

  final int _cameraTapIndex = 0;

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
        WillPopScope(
          onWillPop: () {
            // shift to the right-handed-side tap;
            _tabController.animateTo(_cameraTapIndex + 1);
          },
          child: TabCamera(),
        ),
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

  Widget _buildFAB() {
    final tabIndex = _tabController.animation.value;
    print(tabIndex);

    if (tabIndex > 0.7 && tabIndex < 1.7) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return SelectContact();
          }));
        },
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      );
    } else if (tabIndex > 1.7 && tabIndex < 2.7) {
      return FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      );
    } else if (tabIndex > 2.7) {
      return FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      );
    }

    return null;
  }

  _handleAppBarAnimation() {
    // This animation calculation will only work if camera tab index == 0
    if (_tabController.animation.value <= 1.0 && _cameraTapIndex == 0) {
      final value = _tabController.animation.value;
      final appBarHeight = _getappBarHeight(context);

      setState(() {
        _appBarTop = -(1 - value) * appBarHeight;
      });
    }
  }

  _handleTabIndex() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4, initialIndex: 1);
    _tabController.animation.addListener(_handleAppBarAnimation);
    _tabController.animation.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.animation.removeListener(_handleAppBarAnimation);
    _tabController.animation.removeListener(_handleTabIndex);
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
          Container(
            margin: EdgeInsets.only(
              top: marginTop,
            ),
            child: _buildTabView(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: _appBarTop,
            child: Container(
              height: _getappBarHeight(context),
              child: _buildAppBar(),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFAB(),
    );
  }
}
