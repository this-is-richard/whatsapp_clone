import 'package:flutter/material.dart';
import './clip_r_thread.dart';

class RightThread extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final r = 5.0;

  RightThread(this.message, {this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    final clipped = ClipPath(
      clipper: ClipRThread(r),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(r)),
        child: Container(
          constraints: BoxConstraints.loose(MediaQuery.of(context).size * 0.8),
          padding: EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
          color: this.backgroundColor,
          child: Transform(
            transform: Matrix4.diagonal3Values(-1.0, 1.0, 1.0),
            child: Text(
              this.message,
              softWrap: true,
            ),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
    return Transform(
      transform: Matrix4.diagonal3Values(-1.0, 1.0, 1.0),
      child: clipped,
      alignment: Alignment.center,
    );
  }
}
