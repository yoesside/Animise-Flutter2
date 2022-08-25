import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:animise_application/theme/theme.dart';

class DeleteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            //User klik tombol icon delete, product kehapus
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
