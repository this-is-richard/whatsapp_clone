import 'package:flutter/material.dart';

class RoundInput extends StatelessWidget {
  final Color _color;
  final TextEditingController _textController;
  final Function _handleSubmitted;

  RoundInput({
    @required TextEditingController textController,
    @required Function handleSubmitted,
    color,
  })  : _textController = textController,
        _handleSubmitted = handleSubmitted,
        _color = color ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: _color,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 8.0,
            ),
            Icon(
              Icons.insert_emoticon,
              size: 30.0,
              color: Theme.of(context).hintColor,
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
                controller: _textController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            Icon(
              Icons.attach_file,
              size: 30.0,
              color: Theme.of(context).hintColor,
            ),
            SizedBox(
              width: 8.0,
            ),
            Icon(
              Icons.camera_alt,
              size: 30.0,
              color: Theme.of(context).hintColor,
            ),
            SizedBox(
              width: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
