import 'package:flutter/material.dart';
import './select_contact.dart';
import './home.dart';

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
      onPressed: () {},
      child: Icon(
        Icons.camera_alt,
      ),
    );
  } else if (getIsCallList(tabController)) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        Icons.add_call,
      ),
    );
  }

  return null;
}
