import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import '../main.dart';
import '../random_image_url.dart';

class TabCamera extends StatefulWidget {
  @override
  _TabCameraState createState() => _TabCameraState();
}

class _TabCameraState extends State<TabCamera> {
  CameraController controller;
  int _cameraIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void _initCamera(int index) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameras[index], ResolutionPreset.high);

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
      setState(() {
        _cameraIndex = index;
      });
    }
  }

  void _onSwitchCamera() {
    if (controller == null ||
        !controller.value.isInitialized ||
        controller.value.isTakingPicture) {
      return;
    }
    final newIndex = _cameraIndex + 1 == cameras.length ? 0 : _cameraIndex + 1;
    _initCamera(newIndex);
  }

  Widget _buildGalleryBar() {
    final barHeight = 90.0;
    final vertPadding = 10.0;

    return Container(
      height: barHeight,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: vertPadding),
        scrollDirection: Axis.horizontal,
        itemCount: 1000,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(right: 5.0),
            width: 70.0,
            height: barHeight - vertPadding * 2,
            child: Image(
              image: randomImageUrl(),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget _buildControlBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.flash_auto),
          onPressed: () {},
        ),
        Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 5.0,
            ),
          ),
        ),
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.switch_camera),
          onPressed: _onSwitchCamera,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _initCamera(_cameraIndex);
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return Text('Loading camera...');
    }

    return Stack(
      children: <Widget>[
        Container(
          color: Colors.black,
          child: Center(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CameraPreview(controller),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _buildGalleryBar(),
            _buildControlBar(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Tap for photo',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (controller != null) {
      controller.dispose();
    }
  }
}
