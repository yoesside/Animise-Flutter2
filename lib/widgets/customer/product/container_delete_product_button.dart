
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:animise_application/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../../providers/state_notifier.dart';

class DeleteButton extends StatelessWidget {

  int id;

  DeleteButton(this.id);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Provider.of<Notifier>(context, listen: false).deleteProductById(context, id);
          },
          child: Image.asset(
            "assets/Delete.png",
            width: 15,
            height: 15,
          ),
        ),
      ],
    );
  }
}
