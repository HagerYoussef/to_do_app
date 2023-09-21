import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message,) {
  List<Widget> actions = [];
    actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('OK')));
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: actions,
        );
      });
}
