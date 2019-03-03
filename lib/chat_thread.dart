import 'package:flutter/material.dart';
import './clip_r_triangle.dart';

class ChatThread extends StatelessWidget {
  final String message;
  final r = 5.0;

  ChatThread(this.message);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipRTriangle(r),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(r)),
        child: Container(
          padding: EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
          // width: 100.0,
          color: Colors.redAccent,
          child: Text(this.message),
        ),
      ),
    );
  }
}
