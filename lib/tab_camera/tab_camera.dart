import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import '../main.dart';

class TabCamera extends StatefulWidget {
  @override
  _TabCameraState createState() => _TabCameraState();
}

class _TabCameraState extends State<TabCamera> {
  CameraController controller;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void initCamera() async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameras[0], ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        _showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showInSnackBar('Error: ${e.code}\n${e.description}');
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return Text('Loading camera...');
    }

    return Stack(
      children: <Widget>[
        CameraPreview(controller),
      ],
    );

    // return AspectRatio(
    //   aspectRatio: controller.value.aspectRatio,
    //   child: CameraPreview(controller),
    // );
  }

  @override
  void dispose() {
    super.dispose();
    if (controller != null) {
      controller.dispose();
    }
  }
}
