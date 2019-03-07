import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final BuildContext scaffoldContext;
  final String title;
  final List<Widget> tabs;
  final TabController tabController;
  final double appBarHeight;

  CustomAppBar(
    this.scaffoldContext,
    this.title,
    this.tabs,
    this.tabController,
    this.appBarHeight,
  );

  @override
  Widget build(BuildContext _) {
    final context = scaffoldContext;

    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Theme.of(context).primaryColor,
      height: appBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 24.0,
              ),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.title.copyWith(
                      color: Theme.of(context).primaryIconTheme.color),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
              ),
            ],
          ),
          TabBar(
            controller: tabController,
            tabs: tabs,
          ),
        ],
      ),
    );
  }
}
