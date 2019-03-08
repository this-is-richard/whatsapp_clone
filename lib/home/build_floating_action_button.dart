import 'package:flutter/material.dart';
import './select_contact.dart';
import '../tab_camera/tab_camera.dart';
import './home.dart';
import '../call_list/select_call_contact.dart';

buildFloatingActionButton(BuildContext context, TabController tabController) {
  if (getIsChatList(tabController)) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return SelectContact();
        }));
      },
      child: Icon(
        Icons.message,
      ),
    );
  } else if (getIsStatusList(tabController)) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return TabCamera(
            needScaffold: true,
          );
        }));
      },
      child: Icon(
        Icons.camera_alt,
      ),
    );
  } else if (getIsCallList(tabController)) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return SelectCallContact();
        }));
      },
      child: Icon(
        Icons.add_call,
      ),
    );
  }

  return null;
}
