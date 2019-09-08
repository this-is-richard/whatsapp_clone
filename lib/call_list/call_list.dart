import 'package:flutter/material.dart';

class CallList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Contact $index'),
            subtitle: Text('17 February, 6:16 in the evening'),
            trailing: Icon(Icons.phone),
          );
        });
  }
}
