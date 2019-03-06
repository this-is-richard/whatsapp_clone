import 'package:flutter/material.dart';
import '../UI/round_input.dart';

class SendMessageBar extends StatefulWidget {
  final ValueChanged<String> _handleSubmitted;

  SendMessageBar(this._handleSubmitted);

  @override
  _SendMessageBarState createState() => _SendMessageBarState();
}

class _SendMessageBarState extends State<SendMessageBar> {
  final _textController = TextEditingController();
  bool _showMic = true;

  _handleSubmittedLocal() {
    final text = _textController.text;

    // deal with local first
    _textController.clear();
    setState(() {
      _showMic = true;
    });

    // deal with parent later
    widget._handleSubmitted(text);
  }

  void _handleChange(String text) {
    setState(() {
      _showMic = text.length == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RoundInput(
              textController: _textController,
              handleSubmitted: (String text) {
                _handleSubmittedLocal();
              },
              handleChange: _handleChange,
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: _handleSubmittedLocal,
            child: CircleAvatar(
              child: Icon(_showMic ? Icons.mic : Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
