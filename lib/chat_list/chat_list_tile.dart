import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {
  final Widget avatarChild;
  final String title;
  final String subtitle;
  final String trailingText;
  final VoidCallback _onTap;
  final double avatarRadius;

  ChatListTile(this.avatarChild, this.title, this.subtitle, this.trailingText,
      this._onTap,
      {this.avatarRadius = 20.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: avatarRadius,
              child: avatarChild,
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.subhead,
                        ),
                      ),
                      Text(
                        trailingText,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.caption.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
