import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vuttr/ui/global/colors.dart';

class VAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback continueCallBack;
  final BuildContext context;

  VAlertDialog({
    required this.title,
    required this.content,
    required this.continueCallBack,
    required this.context,
  });

  void show() {
    showDialog(context: context, builder: (context) => this);
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: AlertDialog(
        actionsPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        content: Text(
          content,
          style: TextStyle(
            color: kLightInk,
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: Text("Continue"),
            onPressed: () {
              continueCallBack();
            },
          ),
        ],
      ),
    );
  }
}
