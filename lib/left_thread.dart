import 'package:flutter/material.dart';
import './clip_r_thread.dart';

class LeftThread extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final r = 5.0;

  LeftThread(this.message, {this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipRThread(r),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(r)),
        child: Container(
          constraints: BoxConstraints.loose(MediaQuery.of(context).size * 0.8),
          padding: EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
          color: this.backgroundColor,
          child: Text(
            this.message,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
