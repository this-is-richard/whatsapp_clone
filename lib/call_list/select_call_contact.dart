import 'package:flutter/material.dart';

class SelectCallContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listview = ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.people,
                color: Theme.of(context).iconTheme.color,
              ),
              backgroundColor: Theme.of(context).accentColor,
            ),
            title: Text('New group call'),
          );
        } else if (index == 1) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person_add,
                color: Theme.of(context).iconTheme.color,
              ),
              backgroundColor: Theme.of(context).accentColor,
            ),
            title: Text('New contact'),
          );
        }

        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text('Contact $index'),
          subtitle: Text('Contact $index status...'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.phone),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.videocam),
              ),
            ],
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Contact'),
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
      ),
      body: listview,
    );
  }
}
