
import 'package:flutter/material.dart';

void showConfirmPopup(
  BuildContext context,
  String title,
  String message,
  Function onConfirm
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          MaterialButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            child: const Text("Confirm"),
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}