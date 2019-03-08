import 'package:flutter/material.dart';
import './home.dart';

buildCustomAppBar(
  BuildContext context,
  String title,
  List<Widget> tabs,
  TabController tabController,
  double appBarHeight,
) {
  // https://material.io/design/components/app-bars-top.html#specs
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
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Theme.of(context).primaryIconTheme.color),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            _buildPopupMenuButton(tabController),
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

_buildPopupMenuButton(TabController tabController) {
  if (getIsChatList(tabController))
    return PopupMenuButton(
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (BuildContext _) {
        return [
          {'value': 1001, 'label': 'New group'},
          {'value': 1002, 'label': 'New broadcast'},
          {'value': 1003, 'label': 'New WhatsApp Web'},
          {'value': 1004, 'label': 'Starred messages'},
          {'value': 1005, 'label': 'Settings'},
        ].map((item) {
          return PopupMenuItem(
            value: item['value'],
            child: Text(item['label']),
          );
        }).toList();
      },
    );

  if (getIsStatusList(tabController))
    return PopupMenuButton(
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (BuildContext _) {
        return [
          {'value': 1001, 'label': 'Status privacy'},
          {'value': 1002, 'label': 'Settings'},
        ].map((item) {
          return PopupMenuItem(
            value: item['value'],
            child: Text(item['label']),
          );
        }).toList();
      },
    );

  if (getIsCallList(tabController))
    return PopupMenuButton(
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (BuildContext _) {
        return [
          {'value': 1001, 'label': 'Clear call log'},
          {'value': 1002, 'label': 'Settings'},
        ].map((item) {
          return PopupMenuItem(
            value: item['value'],
            child: Text(item['label']),
          );
        }).toList();
      },
    );

  return Container(width: 0.0, height: 0.0);
}
