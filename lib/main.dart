import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import './home.dart';

List<CameraDescription> cameras;
void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

Future<void> main() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  runApp(WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primaryColor: Color(0xff075e54),
        accentColor: Color(0xFFdcf8c6),
        indicatorColor: Colors.white,
        primaryColorDark: Color(0xFF128C7E),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
      ),
      home: Home(),
    );
  }
}
