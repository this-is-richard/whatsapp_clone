import 'package:flutter/material.dart';
import '../home/home.dart';

class StatusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: listLeadingAvatarRadius,
                child: Icon(Icons.person),
              ),
              Positioned(
                right: 0.0,
                bottom: 0.0,
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Theme.of(context).accentColor,
                  child: Icon(
                    Icons.add,
                    size: 20.0,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ],
          ),
          title: Text('My status'),
          subtitle: Text('Tap to add status update'),
        );
      },
    );
  }
}
