import 'package:flutter/material.dart';

void fireAlert(BuildContext context, Widget content, {String title = 'Something wrong'}) {
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: content,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}