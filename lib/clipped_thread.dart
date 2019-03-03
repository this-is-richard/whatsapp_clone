import 'package:flutter/material.dart';
import './clip_r_left_thread.dart';

class ClippedThread extends StatelessWidget {
  final String message;
  final r = 5.0;

  ClippedThread(this.message);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipRLeftThread(r),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(r)),
        child: Container(
          padding: EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
          color: Color(0xFFdcf8c6),
          child: Text(this.message),
        ),
      ),
    );
  }
}
