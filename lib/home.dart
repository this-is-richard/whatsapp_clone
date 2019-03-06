import 'package:flutter/material.dart';

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
            text: 'A',
          ),
          Tab(
            text: 'B',
          ),
          Tab(
            text: 'C',
          ),
          Tab(
            text: 'D',
          ),
        ],
      ),
    );
  }

  _buildTabView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        Center(
          child: Text('Tab 1'),
        ),
        ListView.builder(
          itemCount: 1000,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Tile $index'),
            );
          },
        ),
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: _getappBarHeight(context) -
                    MediaQuery.of(context).padding.top),
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
    );
  }
}
