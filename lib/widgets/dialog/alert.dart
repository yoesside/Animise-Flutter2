import 'package:flutter/material.dart';

Future fireAlert(BuildContext context, Widget content, {String title = 'Something wrong'}) {
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: content,
  );

  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}